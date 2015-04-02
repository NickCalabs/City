//
//  DataManager.swift
//  city
//
//  Created by Nick on 4/1/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import Foundation

let CityImage = "http://www.reddit.com/r/CityPorn.json?limit=100"

class DataManager {
    
    
    class func getTopImagesFromCityPornWithSuccess(success: ((redditData: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: CityImage)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //3
                success(redditData: urlData)
            }
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
    
    
    
}