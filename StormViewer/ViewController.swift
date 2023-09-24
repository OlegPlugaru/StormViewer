//
//  ViewController.swift
//  StormViewer
//
//  Created by Oleg Plugaru on 24.09.2023.
//

import UIKit

class ViewController: UITableViewController {
    
    var objects = [String]()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items as [String] {
            if item.hasPrefix("nssl") {
                objects.append(item)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row]
//                (segue.destination as! DetailViewController).detailItem = object
                let detaiViewController = segue.destination as! DetailViewController
                detaiViewController.detailItem = objects[indexPath.row]
            }
        }
    }
    
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        
        let object = objects[indexPath.row]
        cell.textLabel!.text = object.description
        return cell
    }
}

