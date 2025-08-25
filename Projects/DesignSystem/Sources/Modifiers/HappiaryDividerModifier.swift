//
//  HappiaryDividerModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI


struct HappiaryDividerModifier: ViewModifier {
    
    let width: CGFloat
    
    let height: CGFloat
    
    let horizontalPadding: CGFloat
    
    let color: Color
    
    func body(content: Content) -> some View {
        let safeWidth = width.isFinite ? width : nil

        content
            .frame(width: safeWidth, height: height)
            .background(color)
            .padding(.horizontal, horizontalPadding)
    }
    
}

extension View {
    
    public func customeDividerStyle(
        width: CGFloat = .infinity,
        height: CGFloat = 1,
        horizontalPadding: CGFloat = 20,
        color: Color = .strokeGray
    ) -> some View {
        self.modifier(
            HappiaryDividerModifier(
                width: width,
                height: height,
                horizontalPadding: horizontalPadding,
                color: color
            )
        )
    }
    
}
