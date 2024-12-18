//
//  ContentView.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var itemViewModel = ItemViewModel()
    @State private var searchBarPinned = false
    @State private var isShowingSheet = false
    
    var body: some View {
        ZStack (alignment: .top){
            // BG Color
            Color("BackgrundColor")
                .ignoresSafeArea()
            //ScrollView
            ScrollView {
                VStack {
                    carouselImage
                    searchListViewContent
                        .padding()
                }
            }
            // Pinned Search Bar (if scrolled to top)
            if searchBarPinned {
                searchBarView
                    .padding(.top, 8)
                    .transition(.move(edge: .top))
            }
            // FAB Button
            FloatingButtonView(isShowingSheet: $isShowingSheet)
            
        }
        .sheet(isPresented: $isShowingSheet) {
            BottomSheetView(itemViewModel: itemViewModel)
        }
    }
}


extension ContentView {
    
    var searchListViewContent: some View {
        VStack {
            GeometryReader { geo in
                VStack{
                    if !searchBarPinned {
                        searchBarView
                    }
                }
                .onChange(of: geo.frame(in: .global).minY) { _ , newValue in
                    searchBarPinned = newValue <= 50
                }
            }
            .frame(height: 50) // Set a height for the search bar
            
            // Item List
            itemListContent
            
        }
    }
    
}

extension ContentView {
    
    // MARK: - Carousel Image
    var carouselImage: some View {
        CarouselImageView()
            .frame(height: 300)
    }
    
    // MARK: -  SearchBar View
    
    var searchBarView: some View {
        SearchBar(text: $itemViewModel.searchText)
    }
    
    // MARK: - List View
    
    var itemListContent:some View {
        ItemListView(itemViewModel: itemViewModel)
    }
    
}


#Preview {
    ContentView()
}
