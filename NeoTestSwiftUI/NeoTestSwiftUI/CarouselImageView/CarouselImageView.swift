//
//  CarouselImageView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import SwiftUI

struct CarouselImageView: View {
    @State  var currentPage = 2
    let viewmodel = CarouselViewModel()
    
    var body: some View {
        VStack {
            // Image
            tabViewImageContent
            
            //Pagination
            paginationView
            
        }
        .padding()
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}



extension CarouselImageView {
    
    // MARK: - Image Slider
    var tabViewImageContent :some View{
        TabView(selection: $currentPage){
            ForEach(viewmodel.images.indices, id: \.self){ index in
                Image(viewmodel.images[index])
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity,maxHeight: 200)
                
                    .clipped()
                    .cornerRadius(10)
                    .tag(index)
            }
            
        }
    }
    
    // MARK: - Pagenetion View
    
    var paginationView :some View{
        HStack {
            ForEach(viewmodel.images.indices, id: \.self){ index in
                Circle()
                    .fill(currentPage == index ? Color.blue: Color.gray)
                    .frame(width: 10,height: 10)
                    .onTapGesture {
                        withAnimation {
                            currentPage = index
                        }
                        
                    }
            }
        }
        .padding(.top, 8)
    }
    
}

#Preview {
    CarouselImageView()
}


