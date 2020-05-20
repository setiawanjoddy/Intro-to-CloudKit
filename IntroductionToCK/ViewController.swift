//
//  ViewController.swift
//  IntroductionToCK
//
//  Created by Setiawan Joddy on 20/05/20.
//  Copyright © 2020 Setiawan Joddy. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var restaurantTableView: UITableView!
    let helper = CloudKitHelper()
    var restaurants: [CKRecord] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantTableView.dataSource = self
        
        // Do any additional setup after loading the view.
//        helper.saveRestaurant(name: "KFC", address: "GOP 9")
        helper.fetchAll { (records) in
            self.restaurants = records
            DispatchQueue.main.async {
                self.restaurantTableView.reloadData()
            }
        }
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CloudKitCell", for: indexPath)
        
        cell.textLabel?.text = restaurants[indexPath.row]["name"] as? String
        
        return cell
    }
    
}

