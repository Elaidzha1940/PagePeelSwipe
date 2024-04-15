//  /*
//
//  Project: PagePeelSwipe
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 12.04.2024
//
//  */

import SwiftUI

struct ContentView: View {
    @State var animate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.gray.opacity(0.5), .green.opacity(0.3)],
                               startPoint: .topTrailing,
                               endPoint: .bottomLeading)
                .ignoresSafeArea()
                
                VStack {
                    Search()
                        .padding()
                    Head()
                }
            }
            .navigationTitle("Search Movies")
        }
    }
}

#Preview {
    ContentView()
}

