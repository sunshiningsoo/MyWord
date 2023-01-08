//
//  WordCardView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

struct WordCardView: View {
    @State var meaningShow: Bool = false
    var word: Word
    
    var body: some View {
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
                    if !word.example.isEmpty {
                        Text(word.example)
                            .font(.subheadline)
                            .fontWeight(.regular)
                    }
                }.accentColor(Color(.systemBackground))
                Spacer()
                Text(meaningShow ? word.meaning : "뜻 보기")
                    .font(.title3)
                    .foregroundColor(Color(.systemBackground))
                    .onTapGesture {
                        meaningShow.toggle()
                    }
            }
            .padding()
            .frame(width: UIScreen.screenWidth - 40, height: 100)
        }
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(word: Word(alphabet: "Hello", meaning: "안녕", example: "EXAMPLE"))
    }
}
