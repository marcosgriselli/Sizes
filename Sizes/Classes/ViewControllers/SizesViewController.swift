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
    
    /// MARK: - Public API
    public var scalesViewIfNecessary: Bool = true
    
    override open var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.88, alpha: 1.0)
        becomeFirstResponder()
        
        addChild(configurationController)
        let configView = configurationController.view!
        configView.translatesAutoresizingMaskIntoConstraints = false
        
        /// TODO: - Create UIStyle
        configView.layer.cornerRadius = 12.0
        if #available(iOS 11.0, *) {
            configView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        configView.layer.shadowColor = UIColor.black.cgColor
        configView.layer.shadowOpacity = 0.15
        configView.layer.shadowRadius = 4
        configView.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.addSubview(configView)
        
        NSLayoutConstraint.activate([
            configView.leftAnchor.constraint(equalTo: view.leftAnchor),
            configView.rightAnchor.constraint(equalTo: view.rightAnchor),
            configView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        configurationController.didMove(toParent: self)
        configurationController.update = { [unowned self] orientation, device, textSize in
            self.debug(device: device, orientation: orientation, contentSize: textSize)
        }
    }
    
    // Enable detection of shake motion
    override open func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            presentConfiguration()
        }
    }
    
    public func presentConfiguration() {
        DispatchQueue.main.async { [unowned self] in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.configurationController.view.transform = .identity
            }, completion: nil)
        }
    }
    
    internal func debug(device: Device,
                        orientation: Orientation,
                        contentSize: UIContentSizeCategory) {
        guard let containedViewController = containedController else {
            return
        }
        
        let layout = LayoutFactory.configurationFor(device: device, orientation: orientation, contentSizeCategory: contentSize)
        
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = containedView.constraintTo(size: layout.size)
        
        setOverrideTraitCollection(layout.traits, forChild: containedViewController)
        containedViewController.view.setNeedsLayout()
        containedViewController.view.layoutIfNeeded()
        
        if scalesViewIfNecessary {
            containedView.transform = .identity
            let containedSize = containedView.bounds.size
            let canvasSize = view.bounds.size
            if containedSize.exceeds(size: canvasSize) {
                let scaledSize = containedSize.scaleToFit(size: canvasSize)
                containedView.transform = CGAffineTransform(scaleX: scaledSize.width / containedSize.width, y: scaledSize.height / containedSize.height)
            }
        }
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
    
    public func set(devices: [Device]) {
        configurationController.supportedDevices = devices
    }
}
