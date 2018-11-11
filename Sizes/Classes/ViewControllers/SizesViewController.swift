//
//  ResizerViewController.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 31/08/2018.
//

import UIKit

/// This is the main view controller of the library. It will contain
/// both the configuration view and the apps real root view controller
/// to resize when necessary.
open class SizesViewController: UIViewController {
    
    /// Your apps root view controller
    private(set) weak var containedController: UIViewController?
    
    /// containedController's view
    private weak var containedView: UIView!
    
    /// Constraints that update when the device type changes
    private var currentConstraints = [NSLayoutConstraint]()
    
    /// Configuration controller to setup the desired layout
    private let configurationController = ConfigurationViewController()
    
    private var currentLayout: Layout?
    
    internal var pinsViewToTop = false
    
    /// MARK: - Public API
    
    /// Scales the contained view when the device to layout is larger than the device than is currently running Sizes
    public var scalesViewIfNecessary: Bool = true
    
    open override var shouldAutorotate: Bool {
        return true
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    /// Performs layout for selected device, orientation and content size.
    ///
    /// - Parameters:
    ///   - device: device to be simulated
    ///   - orientation: device orientation
    ///   - contentSize: font size from UIContentSizeCategory
    internal func debug(device: Device,
                        orientation: Orientation,
                        contentSize: UIContentSizeCategory) {
        guard let containedViewController = containedController, let sizesWindow = UIApplication.shared.windows.first(where:
            { $0 is SizesWindow }) else {
            return
        }
        
        let layout = LayoutFactory.layoutFor(device: device, orientation: orientation, contentSizeCategory: contentSize)
        currentLayout = layout
        
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = containedView.constraintTo(size: layout.size)
        
        setOverrideTraitCollection(layout.traits, forChild: containedViewController)
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        sizesWindow.frame = CGRect(origin: CGPoint.zero, size: layout.size)
        
        if scalesViewIfNecessary {
            containedView.transform = .identity
            let containedSize = layout.size
            let canvasSize = UIScreen.main.bounds.size
            if containedSize.exceeds(size: canvasSize) {
                let scaledSize = containedSize.scaleToFit(size: canvasSize)
                let scaleX = scaledSize.width / containedSize.width
                let scaleY = scaledSize.height / containedSize.height
                containedView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
                sizesWindow.frame.size = CGSize(width: sizesWindow.frame.size.width * scaleX, height: sizesWindow.frame.size.height * scaleY)
            }
        }

        sizesWindow.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        if pinsViewToTop {
            sizesWindow.frame.origin.y = 0
        }
    }
    
    /// Contain the passed view controller to resize it and modify its traits
    ///
    /// - Parameter viewController: view controller to be modified by Sizes
    public func contain(viewController: UIViewController) {
      
        // Remove contained view controller if necessary (fixes #19)
        if let containedController = containedController {
            containedView.removeFromSuperview()
            containedController.removeFromParent()
        }
      
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
    
    /// Set the constraints to the device default
    private func resetSizeConstraints() {
        currentConstraints.forEach { $0.isActive = false }
        containedView.removeConstraints(currentConstraints)
        currentConstraints = [
            containedView.widthAnchor.constraint(equalTo: view.widthAnchor),
            containedView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ]
        NSLayoutConstraint.activate(currentConstraints)
    }
    
    internal func generateScreenshot() -> UIImage? {
        guard let layout = currentLayout, let contained = containedController else {
            print("📸 You are trying to take a screenshot of the default layout. We suggest you use the device screenshot functionality for that.")
            return nil
        }
        return contained.view.asImage(traits: layout.traits)
    }
    
    /// Set the devices listed on the configuration view
    ///
    /// - Parameter devices: devices available
    public func set(devices: [Device]) {
        configurationController.supportedDevices = devices
    }
}
