//
//  WordListView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct WordListView: View {
    @StateObject private var viewModel: WordViewModel = WordViewModel()
    @State private var wordPlus: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if viewModel.words.isEmpty {
                        Button {
                            wordPlus.toggle()
                        } label: {
                            Text("나만의 단어를 추가해 보세요!")
                        }
                        .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                        .foregroundColor(.white)
                        .background(Color(.systemOrange))
                        .cornerRadius(20)
                        .offset(y: 100)
                        Spacer()
                    } else {
                        ForEach(viewModel.words) { word in
                            NavigationLink {
                                WordDetailView(word: word)
                                    .environmentObject(viewModel)
                            } label: {
                                WordCardView(word: word)
                            }
                        }
                    }
                }
                .navigationTitle("My Word")
                .toolbar {
                    Image(systemName: "plus")
                        .onTapGesture {
                            wordPlus.toggle()
                        }
                }
            }
        }
        .sheet(isPresented: $wordPlus) {
            AddWordView()
                .environmentObject(viewModel)
        }
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView()
    }
}
