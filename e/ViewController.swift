//
//  ViewController.swift
//  e
//
//  Created by Bry Onyoni on 07/01/2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webViewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://b35000.github.io/E5UI/")
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
        
        webViewContainer.isHidden = true
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if(Float(webView.estimatedProgress) == 1.0){
                webViewContainer.isHidden = false
            }
        }
    }
    
   
}

