//
//  ViewController+Extension.swift
//  friends
//
//  Created by MattHew Phraxayavong on 6/18/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension ViewTableController {
    
    // Function to create cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let person = names[indexPath.row]
        cell.textLabel!.text = person.value(forKey: "name") as! String
        return cell
    }
    
    
    
    
}
