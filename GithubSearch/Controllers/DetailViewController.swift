//
//  DetailViewController.swift
//  GithubSearch
//
//  Created by admin on 06.05.2020.
//  Copyright © 2020 Natali. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  var item: Item?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    label.text = item?.fullName
    detailLabel.text = item?.itemDescription
  }
}
