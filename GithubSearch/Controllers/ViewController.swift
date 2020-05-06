//
//  ViewController.swift
//  GithubSearch
//
//  Created by admin on 29.04.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UITableViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let URL = "https://api.github.com/search/repositories?"
    
    var userText = ""
    
    var results: Welcome? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.rowHeight = 80
       
    }
    
    
    
    func requestInfo(with name: String){
        
        let parameters: [String : String] = [
            "q" : name,
            "per_page" : "10"
        ]

        Alamofire.request(URL, method: .get, parameters: parameters).response { (response) in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            do {
                self.results = try decoder.decode(Welcome.self, from: data)
                self.tableView.reloadData()
    
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: UISearchBarDelegate Methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            userText = text
            requestInfo(with: userText)
        }
        searchBar.resignFirstResponder()
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        userText = searchText
        //        print(userText)
        //        requestInfo(with: userText)
        
    }
    
    
    
    //MARK: UITableView meethods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.items.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        if let result = results?.items[indexPath.row] {
            cell.textLabel?.text = result.fullName
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.item = results?.items[indexPath.row]
        }
    }
    
}

