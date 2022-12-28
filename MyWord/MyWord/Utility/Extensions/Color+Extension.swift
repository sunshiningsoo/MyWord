//
//  Color+Extension.swift
//  MyWord
//
//  Created by 박성수 on 2022/12/27.
//

import SwiftUI

extension Color {
    
    enum color {
        case mainBackground
        case accentGreen
        
    }
    
}

extension CGFloat {
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
}
