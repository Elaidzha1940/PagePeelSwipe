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
                ForEach(images) { image in
                    PeelEffect {
                        CardView(image)
                    } onDelete: {
                          
                    }
                }
            }
            .padding(15)
        }
        .onAppear {
            for index in 1...6 {
                images.append(.init(assetName: "movie \(index)"))
            }
        }
    }
    
    /// Card View
    @ViewBuilder
    func CardView(_ posterModel: PosterModel) -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                Image(posterModel.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
        }
        .frame(height: 250)
        .contentShape(Rectangle())
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
