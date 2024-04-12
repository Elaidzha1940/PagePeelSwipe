//  /*
//
//  Project: PagePeelSwipe
//  File: PeelEffect.swift
//  Created by: Elaidzha Shchukin
//  Date: 12.04.2024
//
//  */

import SwiftUI

/// Custom View  Builder
struct PeelEffect<Content: View>: View {
    var content: Content
    
    /// Delete Callback  for HeadView, When Delete is Clicked
    var onDelete: () -> ()
    
    init(@ViewBuilder content: @escaping() -> Content, onDelete: @escaping () -> ()) {
        self.content = content()
        self.onDelete = onDelete
    }
    /// View Properties
    @State private var dragProgress: CGFloat = .zero
    var body: some View {
        VStack {
            content
            /// Masking Original Content
                .mask {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        let size = $0.size
                        
                        Rectangle()
                        /// Swipe: Right to Left
                        /// This Masking from Right to Left  (Trailing)
                            .padding(.trailing, dragProgress * rect.width)
                        
                    }
                }
                .overlay {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        let size = $0.size
                        
                        content
                        /// Flipping Horizontally for Upside Image
                            .scaleEffect(x: -1)
                        
                        /// Moving Along Side While Dragging
                            .offset(x: size.width - (size.width * dragProgress))
                            .offset(x: size.width * -dragProgress)
                        
                        /// Masking Overlayed Image For Removing Outbound Visibility
                            .mask {
                                Rectangle()
                                    .offset(x: size.width * -dragProgress)
                            }
                            .contentShape(Rectangle())
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        /// Right to Left Swipe: Negative Value
                                        var translationX = value.translation.width
                                        /// Limiting to Max Zero
                                        translationX = max(-translationX, 0)
                                        /// Converting Translation Into Progress  (0 - 1)
                                        let progress = min(1, translationX / size.width)
                                        dragProgress = progress
                                    })
                                    .onEnded({ value in
                                        /// Smooth Ending Animation
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                            dragProgress = .zero // Changed from .zero to 0
                                        }
                                    })
                            )
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .fill(.red.gradient)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "trash")
                                .font(.system(size: 25, weight: .semibold, design: .rounded))
                                .padding(.trailing, 20)
                                .foregroundStyle(.white)
                        }
                        .padding(8)
                )
        }
    }
}

#Preview {
    ContentView()
}