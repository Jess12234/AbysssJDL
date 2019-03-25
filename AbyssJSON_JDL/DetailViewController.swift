//
//  DetailViewController.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsetup()
        
    }
    
    @IBOutlet weak var moviePicImageView: UIImageView!
    @IBOutlet weak var TitleL: UILabel!
    @IBOutlet weak var YearL: UILabel!
    @IBOutlet weak var FormatL: UILabel!
    @IBOutlet weak var EpisodeL: UILabel!
    @IBOutlet weak var StudioL: UILabel!
    @IBOutlet weak var TextFT: UITextView!
    @IBOutlet weak var TextS: UITextView!
    
    var ShowDet: Entry? 
    
    // populating the details or the specIFIC MOVIEsnoktnb
    func detailsetup() {
        if let ShowDet = ShowDet {
            self.navigationItem.title = ShowDet.name
            TitleL.text = ShowDet.name
            YearL.text = ShowDet.yearStart
            FormatL.text = ShowDet.format
            TextFT.text = ShowDet.description
            TextS.text = ShowDet.summary
            if let EpisodeNumber = ShowDet.episodes{
                EpisodeL.text = "\(EpisodeNumber)"
            }
            StudioL.text = ShowDet.network
            getItImage (url: URL(string: ShowDet.imageURL!)!) { (image, error) in
                if error != nil { //check for error when retreaving image
                    print(error?.localizedDescription)
                    return
                }
                DispatchQueue.main.async {
                    self.moviePicImageView.image = image
                }
            }
        }
    }
    
    
    func getItImage(url:URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> Void){
        
        var picture: UIImage?
        let session = URLSession.shared
        let task = session.downloadTask(with: url) { (fileURL, response, error) in
            if error != nil{
                completion(picture,error)
                return
            }
            if let fileURL = fileURL{
                do{
                    let data = try Data(contentsOf: fileURL)
                    picture = UIImage(data: data)
                }catch {
                    completion(picture,error)
                    return
                }
            }
            completion(picture,error)
        }
        task.resume()
    }
}

