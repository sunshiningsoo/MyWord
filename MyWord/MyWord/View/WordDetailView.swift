//
//  WordDetailView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI
import Combine

struct WordDetailView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @Environment(\.dismiss) var dismiss
    @State var alertAction: Bool = false
    @State var wordEdit: Bool = false
    @State var word: Word
    
    var body: some View {
        VStack (spacing: 30) {
            HStack {
                Text(word.alphabet)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Text(word.meaning)
                    .font(.body)
            }
            .padding()
            Divider()
                .background(.orange)
            
            if word.example != "" {
                HStack {
                    Text("예시 문장")
                        .font(.title2)
                    Spacer()
                }.padding()
                HStack {
                    Text(word.example ?? "")
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .toolbar {
            Image(systemName: "trash")
                .onTapGesture {
                    alertAction.toggle()
                }
                .alert(isPresented: $alertAction, content: {
                    Alert(title: Text("\(word.alphabet)를 삭제하시겠습니까?"), primaryButton: .cancel(Text("취소")), secondaryButton: .destructive(Text("삭제"), action: {
                        Task {
                            await viewModel.removeWord(word: word)
                            dismiss()
                        }
                    }))
                })
            Image(systemName: "square.and.pencil")
                .onTapGesture {
                    wordEdit.toggle()
                }
                .sheet(isPresented: $wordEdit) {
                    EditWordView(word: $word)
                }
        }
    }
}

struct WordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WordDetailView(word: Word(alphabet: "Hello", meaning: "안녕", example: "This is Example"))
                .environmentObject(WordViewModel())
        }
    }
}
