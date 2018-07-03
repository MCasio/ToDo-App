//
//  AddViewController.swift
//  ToDo
//
//  Created by Amr Mohamed on 6/23/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    
    @IBAction func addTask(_ sender: UIButton) {
        
        if (textField.text != nil) && (textField.text != "") {
            let todoObj = TodoTask(name: textField.text!, completed: false, type: .medium )
            
            if todoList != nil {
                todoList?.append(todoObj)
            } else {
                todoList = [todoObj]
            }
            
            
            textField.text = ""
            textField.placeholder = "ToDo"
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
