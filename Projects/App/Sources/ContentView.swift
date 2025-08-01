import SwiftUI

import DesignSystem

public struct ContentView: View {
    
    public init() {}
    
    @State private var text1 = ""
    
    @State private var isEnable = true

    public var body: some View {
        VStack {
            Text("안녕하세요오반갑습니다")
                .customTextStyle(
                    fontSize: 15,
                    fontColor: .accentCoral
                )
            
            TextField(
                "",
                text: $text1,
                prompt: Text("이름을 입력해주세요").foregroundColor(.lightGray)
            )
            .customTextFieldStyle()
            
            HappiaryRoundedButton(
                isEnable: $isEnable,
                horizontalPadding: 116,
                height: 30,
                title: "소확행 기록하기",
                fontSize: 14,
                cornerRadius: 12
            ) {
                print("소확행 기록하기")
            }
            
            Divider()
                .customeDividerStyle()
            
            HappiaryLogBox(
                title: "슈퍼문 자만추 해버리기",
                date: "2025.04.09",
                typeImage: .pitapat
            )
        }
        .background(Color.lightPink)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
