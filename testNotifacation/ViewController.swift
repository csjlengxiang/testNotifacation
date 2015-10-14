//
//  ViewController.swift
//  testNotifacation
//
//  Created by csj on 15/9/17.
//  Copyright (c) 2015年 csj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var queue: NSOperationQueue!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NSNotificationCenter.defaultCenter()
        queue = NSOperationQueue()
        queue.name = "xx"
        queue.maxConcurrentOperationCount = 1
        
        var ob = center.addObserverForName("hah", object: nil, queue: queue) { (_) -> Void in
            
            
            print(NSThread.currentThread(), terminator: "")
            
            print("start", terminator: "")
            
            sleep(2)
            
            print("queue over", terminator: "")
        }
        
        var ob1 = center.addObserverForName("hah", object: nil, queue: queue) { (_) -> Void in
            
            
            print(NSThread.currentThread(), terminator: "")
            
            print("start2", terminator: "")
            
            sleep(4)
            
            print("queue over2", terminator: "")
        }
    }

    @IBAction func clicked(sender: AnyObject) {
        
        print(NSThread.currentThread(), terminator: "")
        let center = NSNotificationCenter.defaultCenter()
        center.postNotificationName("hah", object: nil)
        
        queue.addOperationWithBlock { () -> Void in
            print("start1", terminator: "")
            
            
            print(NSThread.currentThread(), terminator: "")
            sleep(2)
            
            print("queue over1", terminator: "")
        }
        
        print("----------hah", terminator: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

