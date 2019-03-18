//
//  DataManager.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/1ahrbfLinks"
    
    var dataArray = ["No data yet"]
    
    func getData(completion: @escaping (_ success: Bool) ->())
    {
        var success = true
        let actualUrl = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualUrl!){
            (data, response, error) in
            
            if let _ = data, error == nil {
                
                if let jsonObj = try?
                    JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary
                {
                    print(jsonObj!.value(forKey:"franchiseName")!)
                    
                    if let spaceArray = jsonObj!.value(forKey: "franchiseName")as? Array<String>
                    {
                        self.dataArray = spaceArray
                        
                        print(jsonObj!.value (forKey: "franchiseName")!)
                    }
                }
            } else {
                success = false
            }
            completion(success)
        }
        task.resume()
    }

}
