//
//  Word.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import Foundation

struct Word: Identifiable, Codable {
    var id: UUID = UUID()
    var alphabet: String
    var meaning: String
    var example: String?
    
}
