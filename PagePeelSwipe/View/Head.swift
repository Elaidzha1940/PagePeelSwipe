/*
 
 Project: PagePeelSwipe
 File: Head.swift
 Created by: Elaidzha Shchukin
 Date: 12.04.2024
 
 */

import SwiftUI

/// Sample Model For Displaying Movie Posters
struct Head: View {
    @State private var images: [PosterModel] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ForEach(images) { image in
                    PeelEffect {
                        CardView(image)
                    } onDelete: {
                        /// Deleting Card
                        if let index = images.firstIndex(where: { IN in
                            IN.id == image.id
                        }) {
                            let _ = withAnimation(.easeInOut(duration: 0.35)) {
                                images.remove(at: index)
                            }
                        }
                    }
                }
            }
            .padding(15)
        }
        .onAppear {
            for index in 1...5 {
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
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            }
        }
        .frame(height: 200)
        .contentShape(Rectangle())
    }
}

#Preview {
    ContentView()
}



