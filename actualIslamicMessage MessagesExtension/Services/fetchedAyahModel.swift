//
//  fetchedAyahModel.swift
//  QuranFinder
//
//  Created by Iman Morshed on 12/30/23.
//

import Foundation

class FetchedAyahModel: Codable {
    let content: String
//    let id: String
    let translationEng: String
    let transliteration: String
    var verseID: Int = 1
    var chapterID: Int = 1
    enum CodingKeys: String, CodingKey {
        case content
//        case id
        case translationEng = "translation_eng"
        case transliteration
    }
    
    init(content: String, translationEng: String, transliteration: String) {
        self.content = content
        self.translationEng = translationEng
        self.transliteration = transliteration
    }
}
