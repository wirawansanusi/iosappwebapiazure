//: Playground - noun: a place where people can play

import UIKit

class Item {
    
    var isSelected: Bool = true
    
    func toggleSelected() {
        isSelected = !isSelected
    }
}

var item = Item()
item.isSelected
item.toggleSelected()
item.isSelected
item.toggleSelected()
item.isSelected