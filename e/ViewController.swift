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
        
        webViewContainer.alpha = 0
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let source: String = "var meta = document.createElement('meta');" +
            "meta.name = 'viewport';" +
            "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
            "var head = document.getElementsByTagName('head')[0];" +
            "head.appendChild(meta);"
        
        let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        
        webView.configuration.userContentController.addUserScript(script)
        
        webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if(Float(webView.estimatedProgress) == 1.0){
                sleep(1)
//                webViewContainer.isHidden = false
                animate_webview_container()
            }
        }
    }
    
    
    func animate_webview_container(){
        UIView.animate(withDuration: 0.5) {
            self.webViewContainer.alpha = 1.0
        }
    }
    
   
}

