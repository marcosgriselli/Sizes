//
//  SizesWindow.swift
//  Pods-Sizes_Example
//
//  Created by Bahadir Oncel on 14.10.2018.
//

import UIKit

open class SizesWindow: UIWindow {
    
    /// SizesViewController that will update the contained view
    public let sizesViewController = SizesViewController()
    
    /// Window to display the configuration UI
    private let configurationWindow: UIWindow
    
    /// Public API
    open var shakeGestureEnabled: Bool = true
    
    override open var rootViewController: UIViewController? {
        get {
            return sizesViewController.containedController
        }
        set {
            guard let root = newValue, !root.isKind(of: SizesViewController.self) else {
                return
            }
            super.rootViewController = sizesViewController
            sizesViewController.contain(viewController: root)
        }
    }
    
    public init() {
        let configurationController = ConfigurationViewController()
        configurationWindow = UIWindow(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: 375, height: 367))
        configurationWindow.backgroundColor = .clear
        configurationWindow.windowLevel = .alert
        configurationWindow.rootViewController = configurationController
        configurationWindow.makeKeyAndVisible()
        
        super.init(frame: UIScreen.main.bounds)
        
        configurationController.update = { [unowned self] orientation, device, textSize in
            self.sizesViewController.debug(device: device, orientation: orientation, contentSize: textSize)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Enable detection of shake motion
    override open func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if shakeGestureEnabled {
                presentConfiguration()
            }
        }
    }

    /// Manually present the configuration view
    private func presentConfiguration() {
        DispatchQueue.main.async { [unowned self] in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.configurationWindow.frame.origin.y = 300
            }, completion: nil)
        }
    }
}
