//
//  TestHomeView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/29.
//

import SwiftUI

struct TestHomeView: View {
    @EnvironmentObject var viewModel: WordViewModel
    @State private var test: Bool = false
    @State private var noWord: Bool = false
    var item: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray5)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: item) {
                            ZStack {
                                Rectangle()
                                    .frame(height: 150)
                                    .foregroundColor(.orange)
                                    .cornerRadius(20)
                                    .opacity(0.8)
                                Button {
                                    if viewModel.words.count < 2 {
                                        noWord.toggle()
                                    } else {
                                        test.toggle()
                                    }
                                } label: {
                                    Text("랜덤 단어\n테스트")
                                        .font(.title)
                                }
                                .alert(isPresented: $noWord, content: {
                                    Alert(title: Text("나만의 단어를 추가해 보세요😀"), message: Text("2개 이상의 단어로 테스트를 진행할 수 있습니다."), dismissButton: .default(Text("닫기")))
                                })
                                .frame(width: 100, height: 50)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .offset(y: -30)
                                .fullScreenCover(isPresented: $test) {
                                    TestView()
                                        .environmentObject(viewModel)
                                }
                                .padding()
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("테스트")
        }
    }
}

struct TestHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TestHomeView()
    }
}
