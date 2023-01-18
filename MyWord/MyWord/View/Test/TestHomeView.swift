//
//  TestHomeView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/29.
//

import SwiftUI

struct TestHomeView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @State private var onWordTest: Bool = false
    @State private var manyWordTest: Bool = false
    @State private var noWord: Bool = false
    var item: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.basicBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: item) {
                        // MARK: - 단어 한개
                        Button {
                            checkOneWordTestValid()
                        } label: {
                            ZStack (alignment: .leading) {
                                Rectangle()
                                    .frame(height: 150)
                                    .foregroundColor(.orange)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                HStack (spacing: 20) {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    Text("단어 한개")
                                        .font(.headline)
                                }.padding()
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        
                        // MARK: - 단어 여러개
                        Button {
                            checkManyWordTest()
                        } label: {
                            ZStack (alignment: .leading) {
                                Rectangle()
                                    .frame(height: 150)
                                    .foregroundColor(.orange)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                HStack (spacing: 20) {
                                    Image(systemName: "book")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                    Text("단어\n여러개")
                                        .font(.headline)
                                }.padding()
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                }
                .alert(isPresented: $noWord, content: {
                    Alert(title: Text("나만의 단어를 추가해 보세요😀"), message: Text("2개 이상의 단어로 테스트를 진행할 수 있습니다."), dismissButton: .default(Text("닫기")))
                })
                .fullScreenCover(isPresented: $onWordTest) {
                    OneWordTestView()
                        .environmentObject(viewModel)
                }
                .fullScreenCover(isPresented: $manyWordTest) {
                    ManyWordTestView()
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("테스트")
        }
    }
    
    private func checkOneWordTestValid() {
        if viewModel.words.count < 2 {
            noWord.toggle()
        } else {
            onWordTest.toggle()
        }
    }
    
    private func checkManyWordTest() {
        if viewModel.words.count < 2 {
            noWord.toggle()
        } else {
            manyWordTest.toggle()
        }
    }
}

struct TestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TestHomeView()
    }
}
