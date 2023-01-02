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
                    LazyVGrid(columns: item) {
                        Button {
                            if viewModel.words.count < 2 {
                                noWord.toggle()
                            } else {
                                test.toggle()
                            }
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
                        .alert(isPresented: $noWord, content: {
                            Alert(title: Text("나만의 단어를 추가해 보세요😀"), message: Text("2개 이상의 단어로 테스트를 진행할 수 있습니다."), dismissButton: .default(Text("닫기")))
                        })
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .fullScreenCover(isPresented: $test) {
                            TestView()
                                .environmentObject(viewModel)
                        }
                        .padding()
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
