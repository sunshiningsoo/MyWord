//
//  TextView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/28.
//

import SwiftUI

struct OneWordTestView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: WordViewModel
    @State private var upAnswerPick: Bool = false
    @State private var downAnswerPick: Bool = false
    @State var pickNum = 0
    @State var word: Word?
    @State var fakeWord: Word?
    let randomSeed: Int = Int.random(in: 0...1) % 2
    
    var body: some View {
        ZStack {
            Color(.basicBackground)
                .ignoresSafeArea()
            VStack (spacing: 20) {
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenWidth * 0.8)
                        .cornerRadius(10)
                        .foregroundColor(Color(.systemGray4))
                        .opacity(0.4)
                    Text(word?.alphabet ?? "")
                        .font(.largeTitle)
                        .bold()
                }
                
                Button {
                    // 위 버튼을 누르게 되었을때
                    pickNum = 0
                    upAnswerPick.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenWidth * 0.2)
                            .foregroundColor(.orange)
                            .opacity(0.8)
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        Text(randomSeed == 0 ? word?.meaning ?? "" : fakeWord?.meaning ?? "")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                .alert(isPresented: $upAnswerPick, content: {
                    answerAlert(0)
                })
                
                Button {
                    // 아래 버튼을 눌렀을때
                    pickNum = 1
                    downAnswerPick.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: UIScreen.screenWidth * 0.8, height: UIScreen.screenWidth * 0.2)
                        .foregroundColor(.orange)
                        .opacity(0.8)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                        Text(randomSeed == 1 ? word?.meaning ?? "" : fakeWord?.meaning ?? "")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                .alert(isPresented: $downAnswerPick, content: {
                    answerAlert(1)
                })
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
        .task {
            let array = await viewModel.returnTwoWords()
            if !array.isEmpty {
                word = array.first!
                fakeWord = array[1]
            }
        }
    }
    
    private func answerAlert(_ pickNum: Int) -> Alert {
        if pickNum == pickNum && randomSeed == pickNum {
            return Alert(title: Text("정답입니다🧡"), dismissButton: .default(Text("확인"), action: {
                dismiss()
            }))
        } else if pickNum == pickNum && randomSeed == (pickNum == 0 ? 1 : 0) {
            return Alert(title: Text("틀렸습니다❌"), message: Text("다시 골라보세요!"), dismissButton: .default(Text("확인")))
        } else {
            return Alert(title: Text("ERR"))
        }
    }
}
