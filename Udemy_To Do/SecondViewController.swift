//
//  SecondViewController.swift
//  Udemy_To Do
//
//  Created by Abdulhakim Ajetunmobi on 20/08/2016.
//  Copyright © 2016 5to9 Studios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(_ sender: AnyObject) {
        
        var items:[String]
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
            
            items.append(itemText.text!)
            
        }else{
            
            items = [itemText.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemText.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

