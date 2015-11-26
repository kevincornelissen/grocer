//
//  FirstViewController.swift
//  grocer
//
//  Created by Kevin Cornelissen on 23/11/15.
//  Copyright © 2015 Kevin Cornelissen. All rights reserved.
//

import UIKit

class ChecklistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {}
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if editingStyle == UITableViewCellEditingStyle.Delete{
            myItemList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(myItemList, forKey: "myItems")
            myTableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItemList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "myCell")
        myCell.textLabel?.text = myItemList[indexPath.row]

        return myCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark
            {
                cell.accessoryType = .None
            }
            else
            {
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
        if (NSUserDefaults.standardUserDefaults().objectForKey("myItems") != nil) {
            myItemList = NSUserDefaults.standardUserDefaults().objectForKey("myItems") as! [String]
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

