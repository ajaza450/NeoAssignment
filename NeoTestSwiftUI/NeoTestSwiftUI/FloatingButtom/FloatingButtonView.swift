//
//  FloatingButtonView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct FloatingButtonView: View {
    @Binding var isShowingSheet: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                
                ///FloatingButton
                floatingButton
            }
        }
    }
}


extension FloatingButtonView {
    
    // MARK: - FloatingButton

    var floatingButton: some View {
        Button(action: {
            isShowingSheet.toggle()
        }, label: {
            buttonLayout
        })
        .padding()
    }
    
    // MARK: - Floating Button Layout
    
    var buttonLayout: some View {
        Image("more")
            .renderingMode(.template)
            .foregroundStyle(Color.white)
            .padding()
            .background(Color.blue)
            .clipShape(Circle())
            .shadow(radius: 4)
    }
}


#Preview {
    FloatingButtonView(isShowingSheet: .constant(false))
}


