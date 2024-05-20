//
//  ArabicAyah.swift
//  QuranFinder
//
//  Created by Iman Morshed on 12/31/23.
//

import Foundation
class ArabicAyah: Codable, Identifiable, Equatable, Comparable {
    let text: String
    let number: Int
    let numberInSurah: Int
    let englishText: String
    init(text: String, number: Int, numberInSurah: Int, englishText: String) {
        self.text = text
        self.number = number
        self.numberInSurah = numberInSurah
        self.englishText = englishText
    }
    static func == (lhs: ArabicAyah, rhs: ArabicAyah) -> Bool {
        return (lhs.number == rhs.number) && (lhs.numberInSurah == rhs.numberInSurah)
    }

    static func < (lhs: ArabicAyah, rhs: ArabicAyah) -> Bool {
        if lhs.number == rhs.number {
            return lhs.numberInSurah < rhs.numberInSurah
        }
        return lhs.number < rhs.number
    }
}
