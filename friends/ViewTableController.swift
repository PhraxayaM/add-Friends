//
//  ViewController.swift
//  friends
//
//  Created by MattHew Phraxayavong on 6/18/19.
//  Copyright © 2019 MattHew Phraxayavong. All rights reserved.
//

import UIKit
import CoreData

class ViewTableController: UITableViewController {
    
    var names: [NSManagedObject] = [] {
        didSet{
            tableView.reloadData()
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Title", style: .plain, target: self, action: #selector(addFriend))
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            names = try context.fetch(fetchRequest)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    @objc func addFriend() {
        
        let alert = UIAlertController(title: "New Friend", message: "Add the name", preferredStyle: .alert)
        
        
        let saveFriendAction = UIAlertAction(title: "Save", style: .default) { (action) in
            let textField = alert.textFields?.first
            let textContent = textField?.text
            
            self.save(textContent!)
            //                self.tableView.reloadData()
            
        }
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addTextField()
        alert.addAction(saveFriendAction)
        alert.addAction(cancelButtonAction)
        present(alert, animated: true)
    }
    
    func save(_ receiveName: String) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(receiveName, forKeyPath: "name")
        
        do {
            try context.save()
            names.append(person)
        }catch let error as NSError {
            print(error.userInfo)
        }
        
        
    }
    
    
    
}

