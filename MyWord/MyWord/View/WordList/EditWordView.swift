//
//  EditWordView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct EditWordView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var word: Word
    
    enum Size {
        static let padding: CGFloat = 20
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("단어")
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                TextField("단어를 입력하세요", text: $word.alphabet)
                    .padding()
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }.padding(EdgeInsets(top: 0, leading: Size.padding, bottom: 10, trailing: Size.padding))
            
            VStack {
                HStack {
                    Text("단어의미")
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                TextField("단어의 의미는?", text: $word.meaning)
                    .padding()
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }.padding(EdgeInsets(top: 0, leading: Size.padding, bottom: 10, trailing: Size.padding))
            
            VStack {
                HStack {
                    Text("예시 문장(선택)")
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                TextField("예시 문장", text: $word.example)
                    .padding()
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }.padding(EdgeInsets(top: 0, leading: Size.padding, bottom: 10, trailing: Size.padding))
            
            Button {
                Task {
                    await viewModel.editWord(word: Word(id: word.id, alphabet: word.alphabet, meaning: word.meaning, example: word.example))
                    dismiss()
                }
            } label: {
                Text("저장하기")
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemOrange))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .offset(y: 60)
    }
}
