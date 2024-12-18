//
//  ItemDetail.swift
//  NeoTestSwiftUI
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import Foundation

// MARK: - ItemInfo Model

struct ItemInfo:Hashable {
    let id = UUID().uuidString
    let title: String
    let subtitle: String
    let imageName: String
}

