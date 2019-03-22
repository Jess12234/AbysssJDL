//
//  MovieDataController.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {

    let JSONURL = "https://api.myjson.com/bins/1e5uji"
    
    func getRebootData(compleation: @escaping (_ success: Data) -> ())
    {
        var success = Data()
        let jsonUrl = URL (string: JSONURL)
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!)
        {
            (data,response,error) in 
        }
    }
    
}
