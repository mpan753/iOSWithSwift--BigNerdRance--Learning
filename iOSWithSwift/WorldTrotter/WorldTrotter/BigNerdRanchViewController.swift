//
//  BigNerdRanchViewController.swift
//  WorldTrotter
//
//  Created by Mia on 5/19/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit
import WebKit

class BigNerdRanchViewController: UIViewController {

    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Bronze: Another Tab, Chapter 6
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.bignerdranch.com")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
