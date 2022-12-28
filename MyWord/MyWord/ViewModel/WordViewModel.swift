//
//  WordViewModel.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

class WordViewModel: ObservableObject {
    
    private let manager = DataManager.shared
    
    @MainActor @Published var words: [Word] = [] {
        didSet {
            Task {
                await manager.writeWord(words: words)
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func loadData() {
        Task {
            let temp = await manager.loadData()
            await MainActor.run(body: {
                self.words = temp
            })
        }
    }
    
    func addWord(word: Word) async {
        await MainActor.run(body: {
            words.insert(Word(alphabet: word.alphabet, meaning: word.meaning, example: word.example), at: 0)
        })
    }
    
    func removeWord(word: Word) async {
        await MainActor.run(body: {
            let index = words.firstIndex { $0.id == word.id }
            if let index = index {
                words.remove(at: index)
            }
        })
    }
    
    func editWord(word: Word) async {
        await MainActor.run(body: {
            let index = words.firstIndex { $0.id == word.id }
            if let index = index {
                words.remove(at: index)
                words.insert(word, at: 0)
            }
        })
    }
    
    func returnTwoWords() async -> [Word] {
        await MainActor.run(body: {
            var temp: [Word] = []
            let testWord = words.randomElement()!
            var fakeWord = words.randomElement()!
            while fakeWord == testWord {
                fakeWord = words.randomElement()!
            }
            temp.append(fakeWord)
            temp.append(testWord)
            return temp
        })
    }
    
}
