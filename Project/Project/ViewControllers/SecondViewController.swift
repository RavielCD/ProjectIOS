//
//  SecondViewController.swift
//  Project
//
//  Created by William Cisneros on 01/05/2018.
//  Copyright © 2018 William Cisneros. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UISearchBarDelegate {
    var manager: BusinessManager = BusinessManager.sharedInstance
    @IBOutlet weak var businessesView: UIView?
    var businessesTableViewController: BusinessesTableViewController?
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        businessesTableViewController = businessesView?.areaViewController as? BusinessesTableViewController
        searchBar.delegate = self

        updateView()        
        manager.onFiltredBusinessesChange = {
            DispatchQueue.main.async {
                self.updateView()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let term = searchBar.text?.isEmpty ?? true ? "bar" : searchBar.text
        manager.getFiltredData(term: term!)
    }

    func updateView() {
        businessesTableViewController?.businesses = manager.filtredBusinesses
    }
}

extension UIView {
    var areaViewController: UIViewController? {
        return subviews.first?.next.flatMap {$0 as? UIViewController}
    }
}
