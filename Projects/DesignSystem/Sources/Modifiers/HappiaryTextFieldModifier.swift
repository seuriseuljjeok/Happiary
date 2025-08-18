//
//  HappiaryTextFieldModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 7/31/25.
//

import SwiftUI


struct HappiaryTextFieldModifier: ViewModifier {
    
    let horizontalPadding: CGFloat
    
    let verticalPadding: CGFloat
    
    let fontSize: CGFloat
    
    let fontColor: Color
    
    let cornerRadius: CGFloat
    
    let borderWidth: CGFloat
    
    let borderColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .font(.poor(fontSize))
            .foregroundStyle(fontColor)
    }
    
}

extension View {
    
    public func customTextFieldStyle(
        horizontalPadding: CGFloat = 16,
        verticalPadding: CGFloat = 16,
        fontSize: CGFloat = 15,
        fontColor: Color = .charcolGray,
        cornerRadius: CGFloat = 14,
        borderWidth: CGFloat = 1,
        borderColor: Color = .lightGray
    ) -> some View {
        self.modifier(
            HappiaryTextFieldModifier(
                horizontalPadding: horizontalPadding,
                verticalPadding: verticalPadding,
                fontSize: fontSize,
                fontColor: fontColor,
                cornerRadius: cornerRadius,
                borderWidth: borderWidth,
                borderColor: borderColor
            )
        )
    }
    
}
