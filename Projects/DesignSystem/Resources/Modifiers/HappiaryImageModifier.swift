//
//  HappiaryImageModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI

struct HappiaryImageModifier: ViewModifier {
    
    let size: CGFloat
    
    let bgColor: Color
    
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(bgColor)
            .aspectRatio(contentMode: .fit)
    }
    
}

extension View {
    
    public func customImageStyle(
        size: CGFloat,
        bgColor: Color = .white.opacity(0),
        cornerRadius: CGFloat = 0
    ) -> some View {
        self.modifier(
            HappiaryImageModifier(
                size: size,
                bgColor: bgColor,
                cornerRadius: cornerRadius
            )
        )
    }
    
}
