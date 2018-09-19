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
        
        addChildViewController(configurationController)
        let configView = configurationController.view!
        configView.translatesAutoresizingMaskIntoConstraints = false
        configView.layer.cornerRadius = 5.0
        configView.layer.shadowColor = UIColor.black.cgColor
        configView.layer.shadowOpacity = 0.15
        configView.layer.shadowRadius = 4
        configView.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.addSubview(configView)
        configurationBottomConstraint = configView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 310)
        NSLayoutConstraint.activate([
            configView.leftAnchor.constraint(equalTo: view.leftAnchor),
            configView.rightAnchor.constraint(equalTo: view.rightAnchor),
            configView.heightAnchor.constraint(equalToConstant: 310),
            configurationBottomConstraint!
            ])
        configurationController.didMove(toParentViewController: self)
        configurationController.update = { [unowned self] orientation, device, textSize in
            self.debug(device: device, orientation: orientation, contentSize: textSize)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [unowned self] in
            self.configurationBottomConstraint?.constant = 0
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
        let deviceSize: CGSize
        let traits: UITraitCollection
        switch (device, orientation) {
        case (.default, .portrait):
            deviceSize = CGSize(width: view.bounds.width, height: view.bounds.height)
            traits = .init()
        case (.default, .landscape):
            deviceSize = CGSize(width: view.bounds.height, height: view.bounds.width)
            traits = .init()
        case (.phone3_5inch, .portrait):
            deviceSize = CGSize(width: 320, height: 480)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone3_5inch, .landscape):
            deviceSize = CGSize(width: 480, height: 320)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone4inch, .portrait):
            deviceSize = CGSize(width: 320, height: 568)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone4inch, .landscape):
            deviceSize = CGSize(width: 568, height: 320)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone4_7inch, .portrait):
            deviceSize = CGSize(width: 375, height: 667)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone4_7inch, .landscape):
            deviceSize = CGSize(width: 667, height: 375)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5_5inch, .portrait):
            deviceSize = CGSize(width: 414, height: 736)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5_5inch, .landscape):
            deviceSize = CGSize(width: 736, height: 414)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5_8inch, .portrait):
            deviceSize = CGSize(width: 375, height: 812)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.phone5_8inch, .landscape):
            deviceSize = CGSize(width: 812, height: 375)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .compact),
                .init(verticalSizeClass: .compact),
                .init(userInterfaceIdiom: .phone)
                ])
        case (.pad, .portrait):
            deviceSize = CGSize(width: 768, height: 1024)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.pad, .landscape):
            deviceSize = CGSize(width: 1024, height: 768)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.pad12_9inch, .portrait):
            deviceSize = CGSize(width: 1024, height: 1366)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        case (.pad12_9inch, .landscape):
            deviceSize = CGSize(width: 1366, height: 1024)
            traits = .init(traitsFrom: [
                .init(horizontalSizeClass: .regular),
                .init(verticalSizeClass: .regular),
                .init(userInterfaceIdiom: .pad)
                ])
        }
        
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = containedView.constraintTo(size: deviceSize)
        
        if #available(iOS 10.0, *) {
            let allTraits = UITraitCollection.init(traitsFrom: [traits, UITraitCollection(preferredContentSizeCategory: contentSize)])
            setOverrideTraitCollection(allTraits, forChildViewController: containedViewController)
            containedViewController.view.setNeedsLayout()
            containedViewController.view.layoutIfNeeded()
//            UIView.animate(withDuration: 0.5) {
//                
//            }
        }
    }
    
    
    public func contain(viewController: UIViewController) {
        addChildViewController(viewController)
        let childView = viewController.view!
        containedView = childView
        childView.translatesAutoresizingMaskIntoConstraints = false
        viewController.didMove(toParentViewController: self)
        view.insertSubview(containedView, at: 0)
        containedView.centerInSuperview()
        resetSizeConstraints()
        containedController = viewController
        
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
