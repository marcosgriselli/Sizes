//
//  ConfigurationViewController.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

internal class ConfigurationViewController: UIViewController {
    
    @IBOutlet weak var orientationSection: UIView!
    @IBOutlet weak var orientationStackView: UIStackView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var deviceStackView: UIStackView!
    @IBOutlet weak var textSizeLabel: UILabel!
    
    /// TODO: - Set default correctly.
    private var selectedOrientation: Orientation = .portrait {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    private var selectedDevice = Device(size: UIScreen.main.bounds.size) ?? .phone4_7inch {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    private var selectedTextSize: UIContentSizeCategory = .large {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    /// TODO: - Select available font sizes.
    let textSizes: [UIContentSizeCategory] = [.extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge]
    
    var update: ((Orientation, Device, UIContentSizeCategory) -> Void)?
    
    init() {
        super.init(nibName: String(describing: ConfigurationViewController.self),
                   bundle: Bundle(for: ConfigurationViewController.self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        orientationSection.isHidden = !supportsRotation
        panGesture.cancelsTouchesInView = false
        panGesture.delegate = self

        /// TODO: - Use a better approach.
        view.transform = CGAffineTransform(translationX: 0, y: view.bounds.height)
    }

    @IBAction func portraitSelected(_ sender: UIButton) {
        select(button: sender, from: orientationStackView)
        selectedOrientation = .portrait
    }
    
    @IBAction func landscapeSelected(_ sender: UIButton) {
        select(button: sender, from: orientationStackView)
        selectedOrientation = .landscape
    }
    
    @IBAction func deviceSelected(_ sender: UIButton) {
        select(button: sender, from: deviceStackView)
        guard let index = deviceStackView.arrangedSubviews.index(of: sender) else {
            return
        }
        selectedDevice = Device.allCases[index]
    }
    
    @IBAction func updateText(_ sender: UISlider) {
        let textSize = textSizes[Int(sender.value)]
        textSizeLabel.text = textSize.rawValue
        selectedTextSize = textSize
    }
    
    private func select(button: UIButton, from stackView: UIStackView) {
        stackView.arrangedSubviews.forEach {
            let button = $0 as! UIButton
            button.backgroundColor = .white
            button.setTitleColor(.purple, for: .normal)
            button.layer.borderWidth = 1
        }
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 0
    }

    @IBAction func dragged(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        switch sender.state {
        case .changed:
            if translation.y > 0 {
            view.transform = CGAffineTransform(translationX: 0, y: translation.y)
            }
        case .cancelled, .ended:
            /// TODO: - Add rubber-banding + force release.
            let percentageComplete = translation.y / view.bounds.height
            let shouldDismiss = percentageComplete > 0.5
            let yMovement = shouldDismiss ? view.bounds.height : 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: yMovement)
            }, completion: nil)
        default: break
        }
    }
}

extension ConfigurationViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let view = touch.view else {
            return true
        }
        
        return !view.isKind(of: UIButton.self)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
