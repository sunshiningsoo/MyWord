//
//  WordCardView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct WordCardView: View {
    @State var meaningShow: Bool = false
    @State var frontAngle = Angle(degrees: 0)
    @State var backAngle = Angle(degrees: 90)
    var word: Word
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(Color(.systemOrange))
                    .cornerRadius(20)
                    .shadow(radius: 3)
                    .padding()
                HStack {
                    Text(word.meaning)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .onTapGesture {
                            meaningShow.toggle()
                            withAnimation(.linear(duration: 0.2)) {
                                backAngle += Angle(degrees: meaningShow ? -90 : 90)
                            }
                            withAnimation(.linear(duration: 0.2).delay(0.2)) {
                                frontAngle += Angle(degrees: meaningShow ? -90 : 90)
                                
                            }
                        }
                }
                .padding()
                .frame(width: UIScreen.screenWidth - 40, height: 100)
            }
            .rotation3DEffect(backAngle, axis: (x: 0, y: 1, z: 0))
            
            ZStack {
                Rectangle()
                    .frame(height: 100)
                    .foregroundColor(Color(.systemOrange))
                    .cornerRadius(20)
                    .shadow(radius: 3)
                    .padding()
                HStack {
                    VStack (alignment: .leading) {
                        Text(word.alphabet)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        if !word.example.isEmpty {
                            Text(word.example)
                                .font(.subheadline)
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    Text("뜻 보기")
                        .rotation3DEffect(frontAngle, axis: (x: 1, y: 0, z: 0))
                        .font(.title3)
                        .foregroundColor(Color(.systemBackground))
                        .onTapGesture {
                            meaningShow.toggle()
                            withAnimation(.linear(duration: 0.2)) {
                                frontAngle += Angle(degrees: meaningShow ? -90 : 90)
                            }
                            withAnimation(.linear(duration: 0.2).delay(0.2)) {
                                backAngle += Angle(degrees: meaningShow ? -90 : 90)
                            }
                        }
                }
                .padding()
                .frame(width: UIScreen.screenWidth - 40, height: 100)
            }
            .rotation3DEffect(frontAngle, axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(word: Word(alphabet: "Hello", meaning: "안녕", example: "EXAMPLE"))
    }
}
