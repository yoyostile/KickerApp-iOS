//
//  ViewController.swift
//  KickerApp-iOS
//
//  Created by Johannes Heck on 14.11.14.
//  Copyright (c) 2014 Johannes Heck. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView?
    
    var lock:Bool = false
    var loadingView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLoadingView()
        // Do any additional setup after loading the view, typically from a nib.
        var url = NSURL(string: "http://kicker.cool/")
        var requestObj = NSURLRequest(URL: url!)
        webView!.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingView!.hidden = false
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView!.hidden = true
    }
    
    func browseToLeague(id: NSNumber) {
        NSLog(id.description)
        if(!lock) {
            var url = NSURL(string: "http://kicker.cool/railslove")
            var requestObj = NSURLRequest(URL: url!)
            webView!.loadRequest(requestObj)
            lock = true
        }
    }
    
    func initLoadingView() {
        loadingView = UIView(
            frame: CGRectMake(
                self.view.frame.size.width / 2 - 40,
                self.view.frame.size.height / 2 - 40,
                80,
                80
            )
        )
        loadingView!.backgroundColor = UIColor(white: 0.0, alpha: 0.6)
        loadingView!.layer.cornerRadius = 5;
        
        var activityView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        activityView.center = CGPointMake(loadingView!.frame.size.width / 2, 35)
        activityView.startAnimating()
        activityView.tag = 100
        loadingView!.addSubview(activityView)
        
        var lblLoading = UILabel(frame: CGRectMake(0, 48, 80, 30))
        lblLoading.text = "Loading..."
        lblLoading.textColor = UIColor(white: 1.0, alpha: 1.0)
        lblLoading.font = UIFont(name: lblLoading.font.fontName, size: 15)
        lblLoading.textAlignment = NSTextAlignment.Center
        
        loadingView!.addSubview(lblLoading)
        
        self.view.addSubview(loadingView!)
    }


}

