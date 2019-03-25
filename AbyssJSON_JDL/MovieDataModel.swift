//
//  MovieDataModel.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    
    var franchise: [Franchises] = []
    
}

class Franchises : Codable {
    var franchiseName = String()
    var  entries: [Entry] = []
    
    
}

class Entry: Codable{
    
    var name:String
    var format: String
    var yearStart: String
    var yearEnd:String?
    var episodes: Int?
    var network: String?
    var imageURL: String?
    var description: String
    var summary: String
    var starring: [Cast] = []
}
class Cast: Codable{
    var name: String
    var playing: String
}


