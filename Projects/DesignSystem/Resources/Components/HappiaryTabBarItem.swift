//
//  HappiaryTabBarItem.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI


public struct HappiaryTabBarItem: View {
    
    let title: String
    
    let icon: Image
    
    let isSelected: Bool
    
    let onTap: () -> Void
    
    public init(
        title: String,
        icon: Image,
        isSelected: Bool,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.isSelected = isSelected
        self.onTap = onTap
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 7) {
            icon
                .customImageStyle(width: 18, height: 18)
            
            Text(title)
                .customTextStyle(
                    alignment: .center,
                    fontSize: 12,
                    fontColor: isSelected ? .accentCoral : .deepBrown
                )
        }
        .frame(width: 75, height: 54)
        .contentShape(Rectangle()) // expend tap area
        .onTapGesture {
            onTap()
        }
    }
    
}
