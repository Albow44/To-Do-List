//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Alan Aumiller II on 1/10/20.
//  Copyright © 2020 Alan Aumiller II. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var itemtextview: UITextField!
    
    @IBAction func add(_ sender: AnyObject) {
        
        var items: [String]
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        if let tempitems = itemObject as? [String]{
            items = tempitems
            items.append(itemtextview.text!)
            //print(items)
        }
        else{
            items = [itemtextview.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemtextview.text = ""
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
}
