//  /*
//
//  Project: PagePeelSwipe
//  File: PosterType.swift
//  Created by: Elaidzha Shchukin
//  Date: 15.04.2024
//
//  */

import SwiftUI

/// Sample Model For PosterDetails
struct DateType: Identifiable {
    var id: Int
    var date: String
    var day: String
}

var dates = [
    DateType(id: 0, date: "8", day: "Mon"),
    DateType(id: 1, date: "9", day: "Thu"),
    DateType(id: 2, date: "10", day: "Wed"),
    DateType(id: 3, date: "11", day: "Fri"),
    DateType(id: 4, date: "12", day: "Tue")
]

/// Sample Model For Displaying Movie Posters
struct PosterModel: Identifiable {
    var id: UUID = .init()
    var assetName: String
}
