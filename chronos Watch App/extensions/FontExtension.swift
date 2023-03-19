//
//  FontExtension.swift
//  chronos Watch App
//
//  Created by Daniel Ferrer on 18/3/23.
//

import SwiftUI

enum FontSize: CGFloat {
    case s12 = 12
    case s16 = 16
    case s20 = 20
    case s30 = 30
    case s60 = 60
}

enum FontType: String {
    case regular = "DS-Digital"
    case digital = "Digital-7 Mono"
}

extension View {
    
    func font(size: FontSize, type: FontType) -> some View {
        return self.font(Font.custom(type.rawValue, size: size.rawValue))
    }
}
