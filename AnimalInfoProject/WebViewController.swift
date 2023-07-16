//
//  WebViewController.swift
//  AnimalInfoProject
//
//  Created by Seyma Catikkasli on 16.07.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var urlString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: urlString!)!))
    }
    

 
}
