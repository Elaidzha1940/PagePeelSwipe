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
    var body: some View {
        NavigationStack {
            Head()
                .navigationTitle("Favorite Movies")
        }
    }
}

#Preview {
    ContentView()
}

//struct ContentView: View {
//    @StateObject var vm = ViewModel()
//    
//    var body: some View {
//        NavigationView {
//            View1(vm: vm)
//                .navigationTitle("View 1")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
