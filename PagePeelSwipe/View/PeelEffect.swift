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
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack {
            content
                .hidden()
                .overlay {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        let size = $0.size
                        
                        /// Replace  it as Background View
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.red.gradient)
                            .overlay(alignment: .trailing) {
                                Button {
                                    onDelete()
                                } label: {
                                    Image(systemName: "trash")
                                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                                        .padding(.trailing, 20)
                                        .foregroundStyle(.white)
                                        .contentShape(Rectangle())
                                }
                                .disabled(!isExpanded)
                            }
                            .padding(.vertical, 8)
                            .contentShape(Rectangle())
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        /// Disabiling Gesture When it's Expanded
                                        guard !isExpanded else { return }
                                        
                                        /// Right to Left Swipe: Negative Value
                                        var translationX = value.translation.width
                                        /// Limiting to Max Zero
                                        translationX = max(-translationX, 0)
                                        /// Converting Translation Into Progress  (0 - 1)
                                        let progress = min(1, translationX / rect.width)
                                        dragProgress = progress
                                    })
                                    .onEnded({ value in
                                        /// Disabiling Gesture When it's Expanded
                                        guard !isExpanded else { return }
                                        
                                        /// Smooth Ending Animation
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                            if dragProgress > 0.25 {
                                                dragProgress = 0.6
                                                isExpanded = true
                                            } else {
                                                dragProgress = .zero
                                                isExpanded = false
                                            }
                                        }
                                    })
                            )
                        /// If we Tap Other Than  Delete Button, It will Reset to Initial State
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                    dragProgress = .zero
                                    isExpanded = false
                                }
                            }
                        
                        /// Shadow
                        Rectangle()
                            .fill(.black)
                            .padding(.vertical, 23)
                            .shadow(color: .black.opacity(0.3), radius: 15, x: 30, y: 0)
                        
                        /// Moving Alomg Side While Dragging
                            .padding(.trailing, rect.width * dragProgress)
                            .mask(content)
                        
                        /// Disable Interaction
                            .allowsHitTesting(false)
                        
                        content
                            .mask {
                                Rectangle()
                                /// Masking Original Content
                                /// Swipe: Right to Left
                                /// This Masking from Right to Left  (Trailing)
                                    .padding(.trailing, dragProgress * rect.width)
                            }
                        /// Disable Interaction
                            .allowsHitTesting(false)
                    }
                }
                .overlay {
                    GeometryReader {
                        let size = $0.size
                        let minOpacity = dragProgress / 0.5
                        let opacity = min(1, minOpacity)
                        
                        content
                        /// Making it Look Like It's Rolling
                            .shadow(color: .black.opacity(dragProgress != 0 ? 0.1 : 0), radius: 5, x: 15, y: 0)
                            .overlay {
                                Rectangle()
                                    .fill(.white.opacity(0.25))
                                    .mask(content)
                            }
                        /// Making is Glow At the Back Side
                            .overlay(alignment: .trailing) {
                                Rectangle()
                                    .fill(
                                        .linearGradient(colors: [
                                            .clear,
                                            .white,
                                            .clear,
                                            .clear
                                        ], startPoint: .leading, endPoint: .trailing)
                                    )
                                    .frame(width: 60)
                                    .offset(x: 40)
                                    .offset(x: -30 + (30 * opacity))
                                
                                /// Moving Alomg Side While Dragging
                                    .offset(x: size.width * -dragProgress)
                            }
                        
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
                        
                    }
                    /// Disable Interaction
                    .allowsHitTesting(false)
                }
        }
    }
}

#Preview {
    ContentView()
}
