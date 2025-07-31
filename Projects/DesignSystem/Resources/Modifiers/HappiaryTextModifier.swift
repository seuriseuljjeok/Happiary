//
//  HappiaryTextModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 7/31/25.
//

import SwiftUI

struct HappiaryTextModifier: ViewModifier {
    
    let fontSize: CGFloat
    
    let fontColor: Color
    
    let padding: EdgeInsets
    
    func body(content: Content) -> some View {
        content
            .font(.poor(fontSize))
            .foregroundStyle(fontColor)
            .padding(padding)
    }
    
}

extension View {
    
    public func customTextStyle(
        fontSize: CGFloat,
        fontColor: Color = Color.charcolGray,
        padding: EdgeInsets = EdgeInsets(.zero)
    ) -> some View {
        self.modifier(
            HappiaryTextModifier(
                fontSize: fontSize,
                fontColor: fontColor,
                padding: padding
            )
        )
    }
    
}
