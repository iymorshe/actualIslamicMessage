//
//  normalizeArabic.swift
//  QuranFinder
//
//  Created by Iman Morshed on 1/1/24.
//

import Foundation

extension String {

func normalizeArabic() -> String {
    let newString = NSMutableString(string: self) as CFMutableString
    CFStringTransform(newString, nil, kCFStringTransformLatinArabic, Bool(truncating: 0))
    CFStringTransform(newString, nil, kCFStringTransformStripCombiningMarks, Bool(truncating: 0))
    return newString as String
}}
