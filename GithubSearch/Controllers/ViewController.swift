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
        
       // requestInfo(with: "Alamofire")
    }
    
    
    
    func requestInfo(with name: String){
        
        let parameters: [String : String] = [
            "q" : name
        ]
        
        Alamofire.request(URL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
               
                //Use SwiftyJSON
                if response.result.value != nil {
                    let json: JSON = JSON(response.result.value!)
                    
                    for i in 0...25 {
                        let result =  json ["items"][i]["full_name"]
                        print(result)
                    }
                }
                
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

