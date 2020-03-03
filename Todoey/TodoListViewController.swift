//
//  ViewController.swift
//  Todoey
//
//  Created by apple on 01/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var itemArray = ["Buy Eggos","Buy Bread","Find Milk"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemArray = defaults.array(forKey: "ToDoListArray") as! [String]
        
    }
    
    //MARK- create datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK- create delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Items", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
          // What will happen once the user clicks add item button
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "create new item"
            textField = alertTextField
            
            
    }
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
        
    }
    
}

