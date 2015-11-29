//
//  FirstViewController.swift
//  grocer
//
//  Created by Kevin Cornelissen on 23/11/15.
//  Copyright © 2015 Kevin Cornelissen. All rights reserved.
//

import UIKit

class ChecklistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {}
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if editingStyle == UITableViewCellEditingStyle.Delete{
            shoppingList.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "myCell")
        if shoppingList[indexPath.row].checked == true {
            myCell.accessoryType = .Checkmark
        }
        myCell.textLabel?.text = shoppingList[indexPath.row].itemName
        return myCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if shoppingList[indexPath.row].checked == true
            {
                shoppingList[indexPath.row].checked = false
                cell.accessoryType = .None
            }
            else
            {
                shoppingList[indexPath.row].checked = true
                cell.accessoryType = .Checkmark
            }
        }

    }
    
    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        myTableView.delegate = self
        myTableView.dataSource = self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

