//
//  HappiaryBackgroundView.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/4/25.
//

import SwiftUI


public struct HappiaryBackgroundView: View {
    
    public init() {}
    
    public var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.linearBlue, .linearPink]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
    
}
