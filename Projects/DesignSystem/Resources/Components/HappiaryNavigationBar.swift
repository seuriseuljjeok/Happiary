//
//  HappiaryNavigationBar.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/2/25.
//

import SwiftUI


public struct HappiaryNavigationBar<Left: View, Center: View, Right: View>: View {
    
    private let left: () -> Left
    
    private let center: () -> Center
    
    private let right: () -> Right
    
    public init(
        left: @escaping () -> Left = { EmptyView() },
        center: @escaping () -> Center = { EmptyView() },
        right: @escaping () -> Right = { EmptyView() }
    ) {
        self.left = left
        self.center = center
        self.right = right
    }
    
    
    public var body: some View {
        HStack(alignment: .center) {
            left()
            
            Spacer()
            
            center()
            
            Spacer()
            
            right()
        }
        .padding(.horizontal, 20)
        .frame(height: 90)
    }
    
}
