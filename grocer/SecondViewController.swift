//
//  SecondViewController.swift
//  grocer
//
//  Created by Kevin Cornelissen on 23/11/15.
//  Copyright © 2015 Kevin Cornelissen. All rights reserved.
//

import UIKit

var myItemList = [String]()


class SecondViewController: UIViewController {
    

    @IBAction func doneEditing(sender: AnyObject) {
        if myItemText.text?.characters.count > 0 {
            myItemList.append(myItemText.text!)
            myItemText.text = ""
            self.view.endEditing(true)
            NSUserDefaults.standardUserDefaults().setObject(myItemList, forKey: "myItems")
            
            self.performSegueWithIdentifier("unwindToList", sender: self)
        }
    }
    
    @IBOutlet weak var myItemText: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

