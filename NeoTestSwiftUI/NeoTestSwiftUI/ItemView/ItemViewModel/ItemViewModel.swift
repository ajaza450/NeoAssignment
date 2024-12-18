//
//  ItemViewModel.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import Foundation
import SwiftUI

class ItemViewModel:ObservableObject {
    // MARK: - Static ItemsArray

     var allItems =  [
        ItemInfo(title: "Apple", subtitle: "apple", imageName: "image"),
        ItemInfo(title: "Banana", subtitle: "Banana", imageName: "image"),
        ItemInfo(title: "Orange", subtitle: "Orange", imageName: "image"),
        ItemInfo(title: "Blueberry", subtitle: "Blueberry", imageName: "image"),
        ItemInfo(title: "Strawberry", subtitle: "Strawberry", imageName: "image"),
        ItemInfo(title: "Grape", subtitle: "Grape", imageName: "image"),
        ItemInfo(title: "Mango", subtitle: "mango", imageName: "image"),
        ItemInfo(title: "Pineapple", subtitle: "pineapple", imageName: "image"),
    ]
    
    
    @Published var searchText: String = ""
    
    // MARK: - Filterd Items According To Text
    var filteredItems: [ItemInfo]  {
        if searchText.isEmpty {
            return allItems
        }else{
            return allItems.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    
    private var characterFrequency: [Character:Int] {
        var freq = [Character:Int]()
        allItems.map({$0.title}).joined().forEach { char in
            freq[char,default: 0] += 1
        }
        return freq
    }
    
    // sorting which character most comes in list
    var sortedFrequency:[(Character, Int)] {
        Array(characterFrequency.sorted{$0.value > $1.value }.prefix(3))
    }
    
}
