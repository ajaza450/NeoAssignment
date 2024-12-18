//
//  BottomSheetView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var itemViewModel:ItemViewModel
    var body: some View {
        VStack(spacing: 20) {
            //title
            titleView
            
            //subtile
            subtitle
           
            //List view
            listView
            
            Spacer()
        }
        .padding()
    }
}

extension BottomSheetView {
    
    // MARK: - Title View
    
    var titleView: some View {
        Text("Statistics")
            .font(.headline)
    }
    
    // MARK: - Total Items Text As Subtitle
    
    var subtitle:some View {
        Text("Total Items: \($itemViewModel.allItems.count)")
    }
    
    // MARK: - ListView
    
    var listView: some View{
        ForEach(itemViewModel.sortedFrequency, id: \.0) { char, count in
            Text("\(char) = \(count)")
        }
    }
    
    
}

#Preview {
    BottomSheetView(itemViewModel: ItemViewModel())
}
