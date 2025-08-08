//
//  HappiaryImageModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI

struct HappiaryImageModifier: ViewModifier {
    
    let width: CGFloat
    
    let height: CGFloat
    
    let bgColor: Color
    
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .background(bgColor)
            .aspectRatio(contentMode: .fit)
    }
    
}

extension View {
    
    public func customImageStyle(
        width: CGFloat,
        height: CGFloat,
        bgColor: Color = .white.opacity(0),
        cornerRadius: CGFloat = 0
    ) -> some View {
        self.modifier(
            HappiaryImageModifier(
                width: width,
                height: height,
                bgColor: bgColor,
                cornerRadius: cornerRadius
            )
        )
    }
    
}
