//
//  ViewController.swift
//  city
//
//  Created by Nick on 4/1/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityChoice1: UIButton!
    @IBOutlet weak var cityChoice2: UIButton!
    @IBOutlet weak var cityChoice3: UIButton!
    @IBOutlet weak var cityChoice4: UIButton!
    
    var URLarr:[String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red:0.24, green:0.28, blue:0.31, alpha:1)
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        
        
        DataManager.getTopImagesFromCityPornWithSuccess { (redditData) -> Void in
            let json = JSON(data:redditData)
            
            for (var i = 0; i < 500; i++){
                if let cityPic = json["data"]["children"][i]["data"]["url"].stringValue as String? {
                    if cityPic.rangeOfString("http://i.") != nil || cityPic.rangeOfString(".jpg") != nil {
                        println("NSURLSession: \(cityPic)")
                        self.URLarr.append(cityPic)
                    }
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func test(sender: AnyObject) {
        let url = NSURL(string: URLarr[1])
        let data = NSData(contentsOfURL: url!)
        cityImage.image = UIImage(data: data!)
    }
    
    
   
}

