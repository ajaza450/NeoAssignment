//
//  ItemCell.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct ItemCell: View {
    var item : ItemInfo
    var body: some View {
        
        ZStack {
            // change backround color
            Color("CellBGColor")
                .ignoresSafeArea()
            // view layout
            VStack(alignment: .leading) {
                cellViewLayout
            }
        }
    }
}


extension ItemCell {
    
    var cellViewLayout: some View {
        HStack(alignment: .center, spacing: 10.0) {
            // Image
            Image(item.imageName)
                .resizable()
                .frame(width: 50,height: 50)
                .scaledToFill()
                .cornerRadius(10)
            VStack {
                // title
                Text(item.title)
                    .font(.system(size: 18,weight: .semibold))
                // subtitle
                Text(item.subtitle)
                    .font(.system(size: 16,weight: .regular))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    ItemCell(item:  ItemInfo(title: "Apple", subtitle: "apple", imageName: "image"))
}
