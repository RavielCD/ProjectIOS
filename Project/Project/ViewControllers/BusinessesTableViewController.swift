//
//  BusinessesTableViewController.swift
//  Project
//
//  Created by William Cisneros on 02/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import Foundation
import UIKit

class BusinessesTableViewController: UITableViewController {
    var businesses: [Business] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let business = businesses[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if let cell = cell as? BusinessesTableViewCell {
            cell.name?.text = business.name
        }
        return cell!
    }
}

class BusinessesTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel?
}
