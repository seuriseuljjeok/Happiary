import SwiftUI

import Core
import DesignSystem

public struct ContentView: View {
    public init() {}

    public var body: some View {
        ZStack {
            Text("안녕하세요오반갑습니다")
                .font(.poor(25))
                .foregroundStyle(Color.accentCoral)
                .padding()
            Image.setImage("fresh")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
