//
//  ViewController.swift
//  ToDo
//
//  Created by Amr Mohamed on 6/23/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    
  
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {


        //Create Complete Action
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView,actionPerformed: (Bool) -> Void) in

            todoList![indexPath.row].completed = true

            tableView.reloadData()

            actionPerformed(true)

        }


        //Create Complete Action
        let reseAction = UIContextualAction(style: .destructive, title: "Reset") { (action: UIContextualAction,sourceView: UIView,actionPerformed: (Bool) -> Void) in
            todoList![indexPath.row].completed = false

            tableView.reloadData()

            actionPerformed(true)
        }


        return UISwipeActionsConfiguration(actions: [completeAction , reseAction])
    }
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          
        
        let cell = UITableViewCell()
        
        var currentCell: TodoTask!
        
        currentCell = todoList![indexPath.row]
        if currentCell != nil {
           cell.textLabel?.text = currentCell.name
        }
        if currentCell.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList!.remove(at: indexPath.row)
            tableView.reloadData()
        }
    
    }

}

