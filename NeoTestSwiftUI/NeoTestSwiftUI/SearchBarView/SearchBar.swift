//
//  SearchBarView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        VStack {
            TextField("Search...", text: $text)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .shadow(radius: 2)
                .padding(.horizontal)
                
            
        }
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
