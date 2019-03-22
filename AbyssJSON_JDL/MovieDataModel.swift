//
//  MovieDataModel.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MovieDataModel: Codable {
    
    var franchise: [Franchieses]
}

class Franchieses: Codable
{
    let franchiseName: String
    let entries: [Entry]
}

class Entry: Codable{
    let name: String
    let format: String
    let yearStart: String
    let yearEnd: String?
    let episodes: Int?
    let network: String?
    let imageURL: String
    let description: String
    let summary: String
    let startting: [Cast]
}

class Cast: Codable{
    let name: String
    let playing: String
}
