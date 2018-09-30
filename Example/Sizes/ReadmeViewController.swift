//
//  ReadmeViewController.swift
//  Sizes_Example
//
//  Created by Marcos Griselli on 30/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import WebKit

class ReadmeViewController: UIViewController {
    
    var webView: WKWebView!
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        
        let url = URL(string:"https://github.com/marcosgriselli")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}

extension ReadmeViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
