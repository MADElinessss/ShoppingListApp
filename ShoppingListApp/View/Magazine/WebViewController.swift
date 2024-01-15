//
//  WebViewController.swift
//  ShoppingListApp
//
//  Created by 신정연 on 1/15/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var list: [Magazine] = MagazineInfo.magazine
    var data: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView(index: data)
    }
    
    func configureWebView(index: Int) {
        let urlString = list[index].link
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
