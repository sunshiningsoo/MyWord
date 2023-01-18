//
//  ManyWordTestView.swift
//  MyWord
//
//  Created by 박성수 on 2023/01/18.
//

import SwiftUI

struct ManyWordTestView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: WordViewModel
    @State private var tabitem: Int = 0
    
    var body: some View {
        ZStack {
            Color(.basicBackground)
                .ignoresSafeArea()
            
            TabView (selection: $tabitem) {
                Text("1")
                    .tag(0)
                Text("2")
                    .tag(1)
                Text("3")
                    .tag(2)
                Text("4")
                    .tag(3)
            }
            .tabViewStyle(.page)
            
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

struct ManyWordTestView_Previews: PreviewProvider {
    static var previews: some View {
        ManyWordTestView()
            .environmentObject(WordViewModel())
    }
}
