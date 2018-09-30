//
//  ResizerViewController.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 31/08/2018.
//

import UIKit

open class SizesViewController: UIViewController {
    
    private(set) weak var containedController: UIViewController?
    private weak var containedView: UIView!
    private var currentConstraints = [NSLayoutConstraint]()
    
    private let configurationController = ConfigurationViewController()
    private var configurationBottomConstraint: NSLayoutConstraint?
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.88, alpha: 1.0)
        
        addChild(configurationController)
        let configView = configurationController.view!
        configView.translatesAutoresizingMaskIntoConstraints = false
        configView.layer.cornerRadius = 12.0
        configView.layer.shadowColor = UIColor.black.cgColor
        configView.layer.shadowOpacity = 0.15
        configView.layer.shadowRadius = 4
        configView.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.addSubview(configView)
        configurationBottomConstraint = configView.topAnchor.constraint(equalTo: view.bottomAnchor)
        NSLayoutConstraint.activate([
            configView.leftAnchor.constraint(equalTo: view.leftAnchor),
            configView.rightAnchor.constraint(equalTo: view.rightAnchor),
            configurationBottomConstraint!
            ])
        configurationController.didMove(toParent: self)
        configurationController.update = { [unowned self] orientation, device, textSize in
            self.debug(device: device, orientation: orientation, contentSize: textSize)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [unowned self] in
            self.configurationBottomConstraint?.isActive = false
            self.configurationBottomConstraint = configView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            self.configurationBottomConstraint?.isActive = true
            self.view.setNeedsLayout()
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc func move(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        containedView.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    internal func debug(device: Device,
                        orientation: Orientation,
                        contentSize: UIContentSizeCategory) {
        guard let containedViewController = containedController else {
            return
        }
        
        let layout = CombinationFactory().configurationFor(device: device, orientation: orientation, contentSizeCategory: contentSize)
        
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = containedView.constraintTo(size: layout.size)

        setOverrideTraitCollection(layout.traits, forChild: containedViewController)
        containedViewController.view.setNeedsLayout()
        containedViewController.view.layoutIfNeeded()
    }
    
    
    public func contain(viewController: UIViewController) {
        addChild(viewController)
        let childView = viewController.view!
        containedView = childView
        childView.translatesAutoresizingMaskIntoConstraints = false
        viewController.didMove(toParent: self)
        view.insertSubview(containedView, at: 0)
        containedView.centerInSuperview()
        resetSizeConstraints()
        containedController = viewController
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            /// TODO: - Test
//            /// generate screenshots
//            print(getDocumentsDirectory())
//            for device in Device.allCases {
//                self.debug(device: device, orientation: .portrait, contentSize: .large)
//                let image = UIImage.from(view: self.containedView)
//                if let data = UIImageJPEGRepresentation(image, 0.8) {
//                    let filename = getDocumentsDirectory().appendingPathComponent("\(device).png")
//                    try? data.write(to: filename)
//                }
//            }
//
//            self.debug(device: .default, orientation: .portrait, contentSize: .large)
//        }
        
        // TODO: - Remove
        let panGesture = UIPanGestureRecognizer()
        panGesture.addTarget(self, action: #selector(move(_:)))
        containedView.isUserInteractionEnabled = true
        containedView.addGestureRecognizer(panGesture)
    }
    
    private func resetSizeConstraints() {
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = [
            containedView.widthAnchor.constraint(equalTo: view.widthAnchor),
            containedView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        NSLayoutConstraint.activate(currentConstraints)
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

extension UIImage {
    static func from(view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let capturedImage = renderer.image { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return capturedImage
    }
}
