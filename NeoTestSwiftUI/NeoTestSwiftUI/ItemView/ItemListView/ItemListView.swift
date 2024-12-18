//
//  ItemListView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(itemViewModel.filteredItems, id: \.self) { item in
                ItemCell(item: item)
                    .cornerRadius(10)
                    
            }
        }
    }
}

#Preview {
    ItemListView(itemViewModel: ItemViewModel())
}
