//
//  MovieDataModel.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MovieDataModel: NSObject {
    
}

class Franchieses: Codable
{
    let franchiseName: String
    let entries; [Entries]
}

class Entries: Codable{
    let name: String
    
}
