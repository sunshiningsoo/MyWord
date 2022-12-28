//
//  MainTabView.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/29.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel: WordViewModel = WordViewModel()
    
    var body: some View {
        TabView {
            WordListView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("내 단어장")
                }
            TestHomeView()
                .environmentObject(viewModel)
                .tabItem {
                    Image(systemName: "book")
                    Text("확인하기")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
