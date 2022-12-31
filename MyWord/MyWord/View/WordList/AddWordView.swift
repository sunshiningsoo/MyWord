//
//  AddWordView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct AddWordView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @Environment(\.dismiss) var dismiss
    @State private var word: String = ""
    @State private var meaning: String = ""
    @State private var example: String = ""
    
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
                TextField("단어를 입력하세요", text: $word)
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
                TextField("단어의 의미는?", text: $meaning)
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
                TextField("예시 문장", text: $example)
                    .padding()
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }.padding(EdgeInsets(top: 0, leading: Size.padding, bottom: 10, trailing: Size.padding))
            
            Button {
                Task {
                    await viewModel.addWord(word: Word(alphabet: word, meaning: meaning, example: example))
                    dismiss()
                }
            } label: {
                Text("저장하기")
                    .frame(width: UIScreen.screenWidth - Size.padding * 2, height: 50)
                    .background(Color(.systemOrange))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            Spacer()
        }
        .offset(y: 60)
    }
}

struct AddWordView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
            .environmentObject(WordViewModel())
    }
}
