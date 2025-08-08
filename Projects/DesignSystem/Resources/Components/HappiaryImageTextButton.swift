//
//  HappiaryImageTextButton.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI


public struct HappiaryImageTextButton: View {
    
    @Binding public var isSelected: Bool
    
    public var isEnable: Bool
    
    public var bgColor: Color
    
    public var typeImage: Image
    
    public var type: String
    
    public init(
        isSelected: Binding <Bool>,
        isEnable: Bool = false,
        bgColor: Color = .white.opacity(0),
        typeImage: Image,
        type: String
    ) {
        self._isSelected = isSelected
        self.isEnable = isEnable
        self.bgColor = bgColor
        self.typeImage = typeImage
        self.type = type
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 7) {
            typeImage
                .resizable()
                .customImageStyle(width: 13, height: 13)
                .padding(.leading, 10)
                .padding(.vertical, 9)
            
            Text(type)
                .customTextStyle(fontSize: 13, padding: EdgeInsets(top: 9, leading: 0, bottom: 9, trailing: 10))
                .fixedSize(horizontal: true, vertical: false)
        }
        .background(bgColor)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isSelected ? Color.charcolGray : Color.lightGray, lineWidth: isEnable ? 1 : 0)
        )
        .onTapGesture {
            if isEnable {
                isSelected.toggle()
            }
        }
    }
    
}
