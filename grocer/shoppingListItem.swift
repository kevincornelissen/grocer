//
//  File.swift
//  grocer
//
//  Created by Kevin Cornelissen on 29/11/15.
//  Copyright © 2015 Kevin Cornelissen. All rights reserved.
//

import Foundation

class shoppingListItem {
    var itemName : String
    var checked : Bool = false
    
    init(itemName : String, checked : Bool = false){
        self.itemName = itemName
        self.checked = checked

    }
}
