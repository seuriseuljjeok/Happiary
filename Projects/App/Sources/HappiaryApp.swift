import SwiftUI

import ComposableArchitecture
import Core

@main
struct HappiaryApp: App {
    
    // 타입 프로퍼티를 사용해 Store 생성
    private static let store = Store(
        initialState: TabStore.State(selectedTab: .home),
        reducer: {
            // _printChanges 메소드를 통해 액션을 감지하고 콘솔로 확인 가능
            TabStore()
                ._printChanges()
        }
    )
    var body: some Scene {
        WindowGroup {
            // Step 5. Store는 기능이 시작되기를 원하는 초기 상태 뿐만 아니라, 기능을 구동하는 Reducer를 지정하는 후행 클로저를 제공함으로써 구성할 수 있음
            TabBarView(
                store: Store(
                    initialState: TabStore.State(selectedTab: .home),
                    reducer: {
                        // Reducer Protocol을 채택한 값을 사용한다는 의미,,?
                        // Step 6. Reducer 주석을 해제하면 빈 깡통 Store를 초기화해서 뷰 확인 가능
                        TabStore()
                    }
                )
            )
        }
    }
    
}
