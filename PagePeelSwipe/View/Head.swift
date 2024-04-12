//  /*
//
//  Project: PagePeelSwipe
//  File: Head.swift
//  Created by: Elaidzha Shchukin
//  Date: 12.04.2024
//
//  */

import SwiftUI

// Sample Model For Displaying Movie Posters

struct Head: View {
    @State private var images: [PosterModel] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                
            }
            .padding(15)
        }
        .onAppear {
            for index in 1...6 {
                images.append(.init(assetName: "Pic \(index)"))
            }
        }
    }
    
    /// Card View
    @ViewBuilder
    func CardView(_ posterModel: PosterModel) -> some View {
        
    }
}

#Preview {
    ContentView()
}

/// Sample Model For Displaying Movie Posters

struct PosterModel: Identifiable {
    var id: UUID = .init()
    var assetName: String
}
