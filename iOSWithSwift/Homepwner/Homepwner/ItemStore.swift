//
//  ItemStore.swift
//  Homepwner
//
//  Created by Mia on 6/6/16.
//  Copyright © 2016 Mia. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = allItems.indexOf(item) {
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        allItems.removeAtIndex(fromIndex)
        allItems.insert(movedItem, atIndex: toIndex)
    }
    
    func itemsMoreThan50() -> [Item] {
        var itemsMoreThan50 = [Item]()
        for item in allItems {
            if item.valueInDollars > 50 {
                itemsMoreThan50.append(item)
            }
        }
        return itemsMoreThan50
    }
    
    func itemsLessOrEqualThan50() -> [Item] {
        var itemsLessOrEqualThan50 = [Item]()
        for item in allItems {
            if item.valueInDollars <= 50 {
                itemsLessOrEqualThan50.append(item)
            }
        }
        return itemsLessOrEqualThan50
    }
}
