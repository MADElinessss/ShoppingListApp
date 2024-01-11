//
//  ADViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/11/24.
//

import UIKit
import WebKit

// 광고 화면
class ADViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebpage("https://velog.io/@maddie/posts")
        
    }
    func loadWebpage(_ url: String) {
        let stringToUrl = URL(string: url)
        let URLToRequest = URLRequest(url: stringToUrl!)
        webView.load(URLToRequest)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
