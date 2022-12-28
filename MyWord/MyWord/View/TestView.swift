//
//  TextView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/28.
//

import SwiftUI

struct TestView: View {
    @Environment(\.dismiss) var dismiss
    var word: Word
    var fakeWord: Word
    let randomSeed: Int = Int.random(in: 0...8) % 2
    
    enum Size {
        static let screenWidth = UIScreen.main.bounds.width
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray3)
                .ignoresSafeArea()
            VStack (spacing: 15) {
                ZStack {
                    Rectangle()
                        .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.8)
                        .cornerRadius(10)
                        .foregroundColor(Color(.systemGray6))
                        .opacity(0.3)
                    Text(word.alphabet)
                        .font(.largeTitle)
                        .bold()
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.2)
                            .foregroundColor(.orange)
                            .opacity(0.8)
                            .cornerRadius(20)
                        Text(randomSeed == 0 ? word.meaning : fakeWord.meaning)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.2)
                        .foregroundColor(.orange)
                        .opacity(0.8)
                        .cornerRadius(20)
                        Text(randomSeed == 0 ? fakeWord.meaning : word.meaning)
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
            }
            
            // MARK: - xmark
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.gray)
                                .opacity(0.5)
                                .cornerRadius(20)
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding()
                }
                Spacer()
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(word: Word(alphabet: "Hello", meaning: "안녕", example: "예시"), fakeWord: Word(alphabet: "Hey", meaning: "헤이", example: "ㅁㄴㅇㄹ"))
    }
}
