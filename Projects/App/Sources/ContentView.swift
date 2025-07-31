import SwiftUI

import DesignSystem

public struct ContentView: View {
    public init() {}
    
    @State private var text1 = ""

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
            
            Image(uiImage: DesignSystemImages.Image.strokedCheckmark)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
