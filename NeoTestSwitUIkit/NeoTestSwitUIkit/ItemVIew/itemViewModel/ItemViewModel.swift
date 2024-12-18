//
//  ItemViewModel.swift
//  NeoTestSwitUIkit
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import Foundation


class ItemViewModel {
    
    // MARK: - Image Carousel Static Images
    let images = ["image", "image", "image","image", "image", "image"]

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
        ItemInfo(title: "Apple", subtitle: "apple", imageName: "image"),
        ItemInfo(title: "Banana", subtitle: "Banana", imageName: "image"),
        ItemInfo(title: "Orange", subtitle: "Orange", imageName: "image"),
        ItemInfo(title: "Blueberry", subtitle: "Blueberry", imageName: "image"),
        ItemInfo(title: "Strawberry", subtitle: "Strawberry", imageName: "image"),
        ItemInfo(title: "Grape", subtitle: "Grape", imageName: "image"),
        ItemInfo(title: "Mango", subtitle: "mango", imageName: "image"),
        ItemInfo(title: "Pineapple", subtitle: "pineapple", imageName: "image"),
    ]
    
    private(set) var filteredItems: [ItemInfo] = []
    
    // MARK: - Initializer
      init() {
          filteredItems = allItems
      }
    
    // MARK: - Filterd Items According To Text
    
    func filteredItems(searchText: String) {
        if searchText.isEmpty {
            filteredItems = allItems
        }else{
            filteredItems =  allItems.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - numberOfFilteredItems

    func numberOfFilteredItems() -> Int {
           return filteredItems.count
       }
    
    // MARK: - Get item according to index

    func getItem(at index: Int) -> ItemInfo? {
            guard index < filteredItems.count else { return nil }
            return filteredItems[index]
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
    
    
     func generateStatistics() -> String {
           // Format the result
            let itemCount = allItems.count
            let frequencyStats = sortedFrequency.map{"\($0.0) = \($0.1)"}.joined(separator: "\n")
            return "Statistics \n\n Total Items: \(itemCount) \n\(frequencyStats)"
        }
    
   
   
}
