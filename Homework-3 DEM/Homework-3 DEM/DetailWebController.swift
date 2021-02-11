//
//  DetailWebController.swift
//  Homework-3 DEM
//
//  Created by Dilda Ezgi Metincan on 17.01.2021.
//

import UIKit
import WebKit

class DetailWebController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        
        
        let url = "https://www.apple.com/tr/iphone-12/"
        let rUrl = URL(string: url)
        let req = URLRequest(url: rUrl!)
        webView.load(req)
        


        
    }
    

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!)
    {
        print("Webview webViewDidCommit")
    }
    func  webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        print("Webview webViewDidFinish")
    }



}
