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
                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                .foregroundColor(Color(.systemOrange))
                .opacity(0.8)
                .cornerRadius(20)
                .shadow(radius: 3)
            HStack {
                Text(word.alphabet)
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                Spacer()
                Text(meaningShow ? word.meaning : "클릭")
                    .font(.title3)
                    .foregroundColor(.white)
                    .onTapGesture {
                        meaningShow.toggle()
                    }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width - 40, height: 100)
            .padding()
        }
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(word: Word(alphabet: "Hello", meaning: "안녕", example: "EXAMPLE"))
    }
}
