//
//  HappiaryRoundedButton.swift
//  DesignSystem
//
//  Created by 윤희슬 on 7/31/25.
//

import SwiftUI

public struct HappiaryRoundedButton: View {
    
    @Binding public var isEnable: Bool
    
    public var horizontalPadding: CGFloat
        
    public var height: CGFloat
    
    public var title: String
    
    public var bgColor: Color
    
    public var fontSize: CGFloat
    
    public var fontColor: Color
    
    public var cornerRadius: CGFloat
    
    public var borderWidth: CGFloat
    
    public var borderColor: Color
    
    public var action: () -> Void
    
    public init(
        isEnable: Binding<Bool>,
        horizontalPadding: CGFloat,
        height: CGFloat,
        title: String,
        bgColor: Color = .white.opacity(0),
        fontSize: CGFloat,
        fontColor: Color = .charcolGray,
        cornerRadius: CGFloat = 14,
        borderWidth: CGFloat = 1,
        borderColor: Color = .strokeGray,
        action: @escaping () -> Void
    ) {
        self._isEnable = isEnable
        self.horizontalPadding = horizontalPadding
        self.height = height
        self.title = title
        self.bgColor = bgColor
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.action = action
    }
    
    
    public var body: some View {
        Button(action: {
            if isEnable {
                action()
            }
        }) {
            Text(title)
                .customTextStyle(
                    alignment: .center,
                    fontSize: fontSize,
                    fontColor: fontColor
                )
                .frame(height: height)
        }
        .padding(.horizontal, horizontalPadding)
        .background(bgColor)
        .background(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(borderColor, lineWidth: borderWidth)
        )
        .disabled(!isEnable)
    }
    
}
