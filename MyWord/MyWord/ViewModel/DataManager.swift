//
//  DataManager.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import Foundation

actor DataManager {
    
    static let shared = DataManager()
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func loadData() throws -> [Word] {
        do {
            let url = getDocumentDirectory().appendingPathComponent("Words")
            let data = try Data(contentsOf: url)
            let words = try JSONDecoder().decode([Word].self, from: data)
            return words
        } catch {
            throw error
        }
    }
    
    func writeWord(words: [Word]) {
        do {
            let data = try JSONEncoder().encode(words)
            let url = getDocumentDirectory().appendingPathComponent("Words")
            try data.write(to: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
