//
//  TextView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/28.
//

import SwiftUI

struct TestView: View {
    @Environment(\.dismiss) var dismiss
    
    enum Size {
        static let screenWidth = UIScreen.main.bounds.width
    }
    var body: some View {
        ZStack {
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.8)
                        .cornerRadius(10)
                        .foregroundColor(Color(.lightGray))
                        .opacity(0.3)
                    Text("Random Word")
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.2)
                            .foregroundColor(.orange)
                            .opacity(0.8)
                        Text("맞는 뜻")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
                
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: Size.screenWidth * 0.8, height: Size.screenWidth * 0.2)
                        .foregroundColor(.orange)
                        .opacity(0.8)
                        Text("다른 단어 뜻")
                            .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                    }
                }
            }
            
            // MARK: - xmark를 위함
            
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
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
