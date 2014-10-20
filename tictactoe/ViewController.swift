//
//  ViewController.swift
//  tictactoe
//
//  Created by Wilson Burhan on 10/17/14.
//  Copyright (c) 2014 Wilson Burhan. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCBrowserViewControllerDelegate {

    @IBOutlet var fields: [TTTImageView]!
    
    var appDelegate:AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.mpcHandler.setupPeerWithDisplayNames(UIDevice.currentDevice().name)
        appDelegate.mpcHandler.setupSession()
        appDelegate.mpcHandler.advertiseSelf(true)
    }
    
    @IBAction func connectWithPlayer (sender: AnyObject){
        if appDelegate.mpcHandler.session != nil {
            appDelegate.mpcHandler.setupBroser()
            appDelegate.mpcHandler.browser.delegate = self
            
            self.presentViewController(appDelegate.mpcHandler.browser, animated: true, completion: nil)
        }
    }
    
    
    func setupGameLogic(){
        for index in 0...fields.count - 1 {
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: "fieldTapped")
            gestureRecognizer.numberOfTapsRequired = 1
            
            fields[index].addGestureRecognizer(gestureRecognizer)
        }
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController!) {
        appDelegate.mpcHandler.browser.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController!) {
        appDelegate.mpcHandler.browser.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

