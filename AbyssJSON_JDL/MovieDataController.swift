//
//  MovieDataController.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {

    let jsonURL = "https://api.myjson.com/bins/1e5uji"
    var MDM = MovieDataModel()
    func getData (completion: @escaping (_ success:MovieDataModel) -> ()){
        
        let jurl = URL(string: jsonURL)
        let session = URLSession.shared
        let task = session.dataTask(with: jurl!) {(data,response, error) in
            
            if error != nil {
                return
            }
            guard let data = data else {
                // call the decoder and run it through the model
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let mediaData = try decoder.decode(MovieDataModel.self, from: data)
                self.MDM = mediaData
            }catch{
                print(error)
                return
            }
            DispatchQueue.main.async{
                completion(self.MDM as! MovieDataModel)
            }
        }
        task.resume()
    }
    
}


