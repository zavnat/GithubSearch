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

class ViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let URL = "https://api.github.com/search/repositories?"
    
    var userText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
       
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
                let people = try decoder.decode(Welcome.self, from: data)
                
                print("count \(people.items.count)")
                print(people)
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
    
    
    
    
    
    
}

