//
//  Beer.swift
//  PUNKBeers
//
//  Created by Heitor Souza on 7/18/17.
//  Copyright © 2017 Heitor Souza. All rights reserved.
//

import Foundation

class Beer {
    
    var id: Int
    var name: String
    var abv: Float
    var imageUrl : String
    
    var tagLine: String
    var ibu: Float
    var description: String
    
    init(id: Int, name: String, abv:Float, imageUrl:String, tagLine: String, ibu: Float, description: String) {
        self.id = id;
        self.name = name;
        self.abv = abv;
        self.imageUrl = imageUrl;
        self.tagLine = tagLine;
        self.ibu = ibu;
        self.description = description;
    }
    
}
