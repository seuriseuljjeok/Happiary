//
//  HappiaryDividerModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI


struct HappiaryDividerModifier: ViewModifier {
    
    let height: CGFloat
    
    let horizontalPadding: CGFloat
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: .infinity, height: height)
            .background(color)
            .padding(.horizontal, horizontalPadding)
    }
    
}

extension View {
    
    public func customeDividerStyle(
        height: CGFloat = 1,
        horizontalPadding: CGFloat = 20,
        color: Color = .strokeGray
    ) -> some View {
        self.modifier(
            HappiaryDividerModifier(
                height: height,
                horizontalPadding: horizontalPadding,
                color: color
            )
        )
    }
    
}
