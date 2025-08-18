//
//  HappiaryTextModifier.swift
//  DesignSystem
//
//  Created by 윤희슬 on 7/31/25.
//

import SwiftUI

struct HappiaryTextModifier: ViewModifier {
    
    let width: CGFloat
    
    let alignment: Alignment
        
    let fontSize: CGFloat
    
    let fontColor: Color
    
    let lineLimit: Int
    
    let multiLineAlignment: TextAlignment
    
    let padding: EdgeInsets
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, alignment: alignment)
            .font(.poor(fontSize))
            .foregroundStyle(fontColor)
            .lineLimit(lineLimit)
            .multilineTextAlignment(multiLineAlignment)
            .padding(padding)
    }
    
}

extension View {
    
    public func customTextStyle(
        width: CGFloat = .infinity,
        alignment: Alignment = .leading,
        fontSize: CGFloat,
        fontColor: Color = Color.charcolGray,
        lineLimit: Int = 1,
        multiLineAlignment: TextAlignment = .leading,
        padding: EdgeInsets = EdgeInsets(.zero)
    ) -> some View {
        self.modifier(
            HappiaryTextModifier(
                width: width,
                alignment: alignment,
                fontSize: fontSize,
                fontColor: fontColor,
                lineLimit: lineLimit,
                multiLineAlignment: multiLineAlignment,
                padding: padding
            )
        )
    }
    
}
