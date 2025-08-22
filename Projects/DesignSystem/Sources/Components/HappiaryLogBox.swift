//
//  HappiaryLogBox.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/1/25.
//

import SwiftUI

public struct HappiaryLogBox: View {
        
    public var title: String
    
    public var date: String
    
    public var typeImage: Image
    
    public init(
        title: String,
        date: String,
        typeImage: Image
    ) {
        self.title = title
        self.date = date
        self.typeImage = typeImage
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text(title)
                    .customTextStyle(fontSize: 20, padding: EdgeInsets(top: 24, leading: 27, bottom: 0, trailing: 0))
                
                Spacer()
                
                Text(date)
                    .customTextStyle(
                        fontSize: 14,
                        fontColor: .lightGray,
                        padding: EdgeInsets(top: 0, leading: 27, bottom: 16, trailing: 0)
                    )
            }
            
            Spacer()
            
            typeImage
                .resizable()
                .customImageStyle(width: 34, height: 34)
                .padding(.trailing, 20)
        }
        .frame(height: 95)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 20)
        .padding(.bottom, 24)
    }
    
}
