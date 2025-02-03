//
//  CategoryModel.swift
//  MusicPlayer
//
//  Created by Aditya on 02/02/25.
//

import Foundation

struct Category: Codable{
var categoryName: String?
}


struct MusicDetail: Codable{
    var musicname: String?
    var categoryame: String?
    var xpPoints:String?
    var countSongs:String?
    var duration: String?
    var image: String?
}


