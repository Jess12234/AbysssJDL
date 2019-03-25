//
//  MasterViewController.swift
//  AbyssJSON_JDL
//
//  Created by Jessica Lowry on 3/18/19.
//  Copyright © 2019 Jessica Lowry. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    var MovieDM : MovieDataModel?{
        didSet{tableView.reloadData()}
    }
    var MDC = MovieDataController()
    
    override func viewDidLoad() {
        //        init(from:MOvieDM)
        super.viewDidLoad()
        
        // go get the data from the datacontroller that gets it and puts it through the model
        if let split = splitViewController {
            _ = split.viewControllers
            print("view did load")
        }
        MDC.getData { (data) in
            //loading the data
            self.MovieDM = data
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "IRDBlogo")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
    
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let maingoto = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                maingoto.ShowDet = MovieDM!.franchise[indexPath.section].entries[indexPath.row]
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return ( MovieDM?.franchise.count ) ?? 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MovieDM?.franchise[section].entries.count ?? 0
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return MovieDM?.franchise[section].franchiseName
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = MovieDM?.franchise[indexPath.section].entries[indexPath.row].name
        cell.detailTextLabel?.text = MovieDM?.franchise[indexPath.section].entries[indexPath.row].yearStart
        return cell
    }
    
}
