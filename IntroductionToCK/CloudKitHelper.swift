//
//  CloudKitHelper.swift
//  IntroductionToCK
//
//  Created by Setiawan Joddy on 20/05/20.
//  Copyright © 2020 Setiawan Joddy. All rights reserved.
//

import Foundation
import CloudKit

struct CloudKitHelper {
    
    var container: CKContainer
    var database: CKDatabase
    
    init() {
        
        container = CKContainer.init(identifier: "iCloud.com.setiawanjoddy.IntroductionToCK")
        database = container.publicCloudDatabase
    }
    
    func saveRestaurant(name: String, address: String) {
        
        let restaurant = CKRecord(recordType: "Restaurant")
        restaurant["name"] = name
        restaurant["address"] = address
        
        
        database.save(restaurant) { (record, error) in
            print(record)
            print(error)
        }
    }
    
    func fetchAll (onCompleted: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        
        database.perform(query, inZoneWith: nil) { (records, error) in
            onCompleted(records!)
        }
    }
}
