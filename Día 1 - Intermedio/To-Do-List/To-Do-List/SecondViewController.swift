//
//  SecondViewController.swift
//  To-Do-List
//
//  Created by Ana on 6/16/19.
//  Copyright © 2019 Ana. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var Item: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
            
            items.append(Item.text!)
            
            print(items)
        } else {
            
            items = [Item.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        Item.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    ///////segunda parte
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

