//  /*
//
//  Project: PagePeelSwipe
//  File: Search.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.04.2024
//
//  */

import SwiftUI

/// Search View
struct Search: View {
    @State var textField = ""
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
                .bold()
            
            TextField("Search movies...", text: $textField)
            
            Image(systemName: "mic.fill")
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
    }
}

#Preview {
    Search()
}
