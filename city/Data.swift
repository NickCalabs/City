//
//  Data.swift
//  city
//
//  Created by Nick on 4/10/15.
//  Copyright (c) 2015 Nick. All rights reserved.
//

import Foundation

class Model: NSObject, Printable {
    let cityName: String
    let imageURL: String
    
    override var description: String {
        return "Name: \(cityName), URL: \(imageURL)\n"
    }
    
    init(cityName: String?, imageURL: String?) {
        self.cityName = cityName ?? ""
        self.imageURL = imageURL ?? ""
    }
}