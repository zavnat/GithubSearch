//
//  ViewController.swift
//  GithubSearch
//
//  Created by admin on 29.04.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let URL = "https://api.github.com/search/repositories?"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestInfo(with: "Alamofire")
    }
    
    
    
    func requestInfo(with name: String){
        
        let parameters: [String : String] = [
            "q" : name
        ]
        
        Alamofire.request(URL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess {
                print(response)
            }
        }
    }
    
    
}

