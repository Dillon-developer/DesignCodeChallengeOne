//
//  Modifiers.swift
//  DesignCodeChallengeOne
//
//  Created by Dillon Lucas on 5/12/22.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .rounded))
            
    }
}
