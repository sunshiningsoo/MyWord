//
//  TestViewModel.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/28.
//

import Foundation

// TODO: - 추후 한개의 테스트를 위함이 아니라 여러개의 테스트를 하기 위해서 필요한 객체
struct TestViewModel {
    var testArray: [Word] = []
    
    init(array: [Word]) {
        self.testArray = array
    }
    
}
