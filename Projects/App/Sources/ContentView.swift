import SwiftUI

import DesignSystem

public struct ContentView: View {
    public init() {}

    public var body: some View {
        ZStack {
            Text("안녕하세요오반갑습니다")
                .customTextStyle(
                    fontSize: 15,
                    fontColor: .accentCoral
                )
            Image(uiImage: DesignSystemImages.Image.strokedCheckmark)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
