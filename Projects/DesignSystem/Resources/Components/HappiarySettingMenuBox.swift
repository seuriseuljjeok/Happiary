//
//  HappiarySettingBox.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/8/25.
//

import SwiftUI

public struct HappiarySettingMenuBox: View {
    
    let title: String
    
    let menuType: SettingMenuType
    
    public init(title: String, menuType: SettingMenuType) {
        self.title = title
        self.menuType = menuType
    }
    
    public var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            Text(title)
                .customTextStyle(fontSize: 18, fontColor: .deepBrown)
            
            Spacer()
            
            switch menuType {
            case .button(let image, let action):
                Button(action: action) {
                    image
                        .resizable()
                        .customImageStyle(width: 8, height: 16)
                }
                
            case .toggle(let isOn):
                Toggle(isOn: isOn) {}
                    .tint(.deepBrown)
                
            case .none:
                EmptyView()
            }
        }
        .frame(width: .infinity, height: 38)
        .padding(.horizontal, 20)
        
    }
    
}
