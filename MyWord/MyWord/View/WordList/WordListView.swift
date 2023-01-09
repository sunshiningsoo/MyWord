//
//  WordListView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct WordListView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @State private var wordPlus: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.basicBackground)
                    .ignoresSafeArea()
                ScrollView {
                    VStack (alignment: .center, spacing: -10) {
                        if viewModel.words.isEmpty {
                            Button {
                                wordPlus.toggle()
                            } label: {
                                Text("첫번째 단어를 추가해 보세요!")
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            .frame(height: 100)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.systemOrange))
                            .cornerRadius(20)
                            .offset(y: 100)
                            .shadow(radius: 3)
                            Text("헷갈리는 단어를 예제와 함께 추가해\n내 것으로 만들어요")
                                .offset(y: 140)
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
                    .navigationTitle("단어장")
                    .toolbar {
                        Image(systemName: "plus")
                            .onTapGesture {
                                wordPlus.toggle()
                            }
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
            .environmentObject(WordViewModel())
    }
}
