//
//  HappiaryModal.swift
//  DesignSystem
//
//  Created by 윤희슬 on 8/8/25.
//

import SwiftUI

public struct HappiaryModal: View {
    
    let mainTitle: String
    
    let subTitle: String
    
    let rightButtonText: String
    
    let rightButtonAction: () -> Void
    
    public init(
        mainTitle: String,
        subTitle: String,
        rightButtonText: String,
        rightButtonAction: @escaping () -> Void
    ) {
        self.mainTitle = mainTitle
        self.subTitle = subTitle
        self.rightButtonText = rightButtonText
        self.rightButtonAction = rightButtonAction
    }
        
    public var body: some View {
        ZStack {            
            Color(.black)
                .opacity(0.3)
                .ignoresSafeArea()
            
            HappiaryModalContent(
                mainTitle: mainTitle,
                subTitle: subTitle,
                rightButtonText: rightButtonText
            ){
                rightButtonAction()
            }
            .padding(44)
        }
    }
    
}

struct HappiaryModalContent: View {
    
    let mainTitle: String
    
    let subTitle: String
    
    let rightButtonText: String
    
    let rightButtonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(mainTitle)
                .customTextStyle(
                    alignment: .center,
                    fontSize: 22,
                    fontColor: .deepBrown,
                    padding: EdgeInsets(top: 32, leading: 32, bottom: 20, trailing: 32)
                )
            
            Text(subTitle)
                .customTextStyle(
                    alignment: .center,
                    fontSize: 16,
                    fontColor: .deepBrown
                )
            
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    print("cancel")
                }) {
                    Text("취소")
                        .customTextStyle(
                            alignment: .center,
                            fontSize: 18,
                            fontColor: .deepBrown
                        )
                }
                .frame(width: 110, height: 35)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                
                Spacer()
                
                Button(action: {
                    print(rightButtonText)
                    rightButtonAction()
                }) {
                    Text(rightButtonText)
                        .customTextStyle(
                            alignment: .center,
                            fontSize: 18,
                            fontColor: .white
                        )
                }
                .frame(width: 110, height: 35)
                .background(Color.deepBrown)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .frame(width: .infinity)
            .padding(.top, 40)
            .padding(.bottom, 24)
            .padding(.horizontal, 24)
        }
        .background(Color.modalBeige)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
}
