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
    @State private var test: Bool = false
    @State private var noWord: Bool = false
    
    // MARK: - TEST VAR
    @State var realWord: Word?
    @State var fakeWord: Word?
    
    var body: some View {
        ZStack{
            NavigationView {
                ZStack {
                    Color(.systemGray5)
                        .ignoresSafeArea()
                    ScrollView {
                        VStack {
                            if viewModel.words.isEmpty {
                                Button {
                                    wordPlus.toggle()
                                } label: {
                                    Text("첫번째 단어를 추가해 보세요!")
                                        .font(.title3)
                                        .bold()
                                }
                                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                                .foregroundColor(.white)
                                .background(Color(.systemOrange))
                                .cornerRadius(20)
                                .offset(y: 100)
                                .shadow(radius: 3)
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
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button("딱 한개\n테스트") {
                        if viewModel.words.count < 2 {
                            noWord.toggle()
                        } else {
                            test.toggle()
                        }
                    }
                    .alert(isPresented: $noWord, content: {
                        Alert(title: Text("나만의 단어를 추가해 보세요😀"), message: Text("2개 이상의 단어로 테스트를 진행할 수 있습니다."), dismissButton: .default(Text("닫기")))
                    })
                    .frame(width: 100, height: 50)
                    .background(Color(.systemOrange))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .offset(y: -30)
                    .fullScreenCover(isPresented: $test) {
                        TestView(word: realWord ?? Word(alphabet: "", meaning: "", example: ""), fakeWord: fakeWord ?? Word(alphabet: "", meaning: "", example: ""))
                    }
                    .padding()
                }
            }
        }
        .task {
            let array = await viewModel.returnTwoWords()
            if array.count == 2 {
                realWord = array.first
                fakeWord = array[1]
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
