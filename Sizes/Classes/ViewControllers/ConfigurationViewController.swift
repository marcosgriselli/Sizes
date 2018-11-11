//
//  ConfigurationViewController.swift
//  DynamicAppResizer
//
//  Created by Marcos Griselli on 08/09/2018.
//

import UIKit

internal class ConfigurationViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var orientationSection: UIView!
    @IBOutlet weak var orientationStackView: UIStackView!
    @IBOutlet weak var deviceStackView: UIStackView!
    @IBOutlet weak var textSizeLabel: UILabel!
    @IBOutlet weak var contentCategorySlider: UISlider!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var optionsStackView: UIStackView!
    
    /// TODO: - Set default correctly.
    /// Selected orientation for layout
    private var selectedOrientation: Orientation = Orientation(current: UIApplication.shared.statusBarOrientation) {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    /// Selected device for layout
    private var selectedDevice = Device(size: UIScreen.main.bounds.size) ?? .phone4_7inch {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    /// Selected content size for layout
    private var selectedTextSize: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory {
        didSet {
            update?(selectedOrientation, selectedDevice, selectedTextSize)
        }
    }
    
    /// TODO: - Select available font sizes.
    /// Devices to be listed on the configuration view
    var supportedDevices: [Device] = Device.allCases {
        didSet {
            set(devices: supportedDevices)
        }
    }
    
    /// Available content size categories
    let textSizes: [UIContentSizeCategory] = [.extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge]
    
    /// Update layout closure
    var update: ((Orientation, Device, UIContentSizeCategory) -> Void)?
    
    /// On screenshot tap closure
    var onScreenshot: (() -> Void)?
    
    open override var shouldAutorotate: Bool {
        return true
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.all
    }
    
    init() {
        super.init(nibName: String(describing: ConfigurationViewController.self),
                   bundle: Bundle(for: ConfigurationViewController.self))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /// TODO: - Create UIStyle
        backgroundView.layer.cornerRadius = 12.0
        if #available(iOS 11.0, *) {
            backgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.15
        backgroundView.layer.shadowRadius = 4
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: -2)

        /// Setup
//        orientationSection.isHidden = !UIApplication.shared.supportsPortraitAndLandscape
        set(devices: supportedDevices)
        
        /// Select correct buttons
        // TODO: - Implement better approach
        if let index = Orientation.allCases.firstIndex(of: selectedOrientation) {
        select(button: orientationStackView.arrangedSubviews[index] as! Button, from: orientationStackView)
        }
        
        if let index = Device.allCases.firstIndex(of: selectedDevice) {
            select(button: deviceStackView.arrangedSubviews[index] as! Button, from: deviceStackView)
        }
        
        if let index = textSizes.firstIndex(of: selectedTextSize) {
            contentCategorySlider.value = Float(index)
            updateText(contentCategorySlider)
        }
    }
    
    /// Set the available devices on screen
    ///
    /// - Parameter devices: devices to be listed
    private func set(devices: [Device]) {
        deviceStackView.removeArrangedSubviews()
        for device in devices {
            let button = Button(style: .normal)
            button.setTitle(device.name, for: .normal)
            button.addTarget(self, action: #selector(deviceSelected(_:)), for: .touchUpInside)
            button.accessibilityIdentifier = device.name
            deviceStackView.addArrangedSubview(button)
        }
    }

    @IBAction func portraitSelected(_ sender: Button) {
        select(button: sender, from: orientationStackView)
        selectedOrientation = .portrait
    }
    
    @IBAction func landscapeSelected(_ sender: Button) {
        select(button: sender, from: orientationStackView)
        selectedOrientation = .landscape
    }
    
    @IBAction func deviceSelected(_ sender: Button) {
        select(button: sender, from: deviceStackView)
        guard let index = deviceStackView.arrangedSubviews.index(of: sender) else {
            return
        }
        selectedDevice = supportedDevices[index]
    }
    
    @IBAction func updateText(_ sender: UISlider) {
        let textSize = textSizes[Int(sender.value)]
        textSizeLabel.text = textSize.rawValue
        selectedTextSize = textSize
    }
    
    @IBAction func takeScreenshot(_ sender: Any) {
        onScreenshot?()
    }
    
    private func select(button: Button, from stackView: UIStackView) {
        stackView.arrangedSubviews
            .compactMap { $0 as? Button }
            .forEach { $0.set(style: .normal) }
        button.set(style: .selected)
    }
    
    @IBAction func selectOption(_ sender: Button) {
        guard let index = optionsStackView.arrangedSubviews.firstIndex(of: sender) else {
            return
        }
        let newStyle: Button.Style = mainStackView.arrangedSubviews[index].isHidden ? .selected : .normal
        UIView.animate(withDuration: 0.2) {
            self.mainStackView.arrangedSubviews[index].isHidden.toggle()
            sender.set(style: newStyle)
            self.mainStackView.layoutIfNeeded()
        }
    }
}
