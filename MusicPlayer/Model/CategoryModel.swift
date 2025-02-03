//
//  CategoryModel.swift
//  MusicPlayer
//
//  Created by Vikas Hareram Shah on 02/02/25.
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

class MusicData {
    // Static method to generate a dictionary
    static func getMusicData() -> [String: [MusicDetail]] {
        // Define Categories
        let freeCategory = Category(categoryName: "Free")
        let forStudyCategory = Category(categoryName: "For Study")
        let forWorkCategory = Category(categoryName: "For Work")
        let forFocusCategory = Category(categoryName: "For Focus")
        
        // Music details for Free category
        let freeMusic = [
            MusicDetail(musicname: "Free Beats", categoryame: "Free", xpPoints: "50", countSongs: "10", duration: "30", image: "image1"),
            MusicDetail(musicname: "Relaxing Tunes", categoryame: "Free", xpPoints: "70", countSongs: "12", duration: "40", image: "image2")
        ]
        
        // Music details for Study category
        let studyMusic = [
            MusicDetail(musicname: "Focus & Study", categoryame: "For Study", xpPoints: "100", countSongs: "15", duration: "50", image: "image3"),
            MusicDetail(musicname: "Concentration Vibes", categoryame: "For Study", xpPoints: "120", countSongs: "18", duration: "60", image: "image4")
        ]
        
        // Music details for Work category
        let workMusic = [
            MusicDetail(musicname: "Work Playlist", categoryame: "For Work", xpPoints: "150", countSongs: "20", duration: "65", image: "image5"),
            MusicDetail(musicname: "Productivity Boost", categoryame: "For Work", xpPoints: "180", countSongs: "22", duration: "70", image: "image2")
        ]
        
        // Music details for Focus category
        let focusMusic = [
            MusicDetail(musicname: "Deep Focus", categoryame: "For Focus", xpPoints: "200", countSongs: "25", duration: "80", image: "image5"),
            MusicDetail(musicname: "Calm & Clear", categoryame: "For Focus", xpPoints: "250", countSongs: "30", duration: "90", image: "image2")
        ]
        
        // Return a dictionary of category names with their associated music details
        return [
            freeCategory.categoryName ?? "Free": freeMusic,
            forStudyCategory.categoryName ?? "For Study": studyMusic,
            forWorkCategory.categoryName ?? "For Work": workMusic,
            forFocusCategory.categoryName ?? "For Focus": focusMusic
        ]
    }
}
