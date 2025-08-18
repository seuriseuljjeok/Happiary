import SwiftUI

import ComposableArchitecture
import Core
import Feature


@main
struct HappiaryApp: App {
    
    var body: some Scene {
        
        WindowGroup {
            let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
            let initialTabState = hasSeenOnboarding ? TabStore.State(selectedTab: .home) : nil

            // Step 5. Store는 기능이 시작되기를 원하는 초기 상태 뿐만 아니라, 기능을 구동하는 Reducer를 지정하는 후행 클로저를 제공함으로써 구성할 수 있음
            RootView(
                store: Store(
                    initialState: RootStore.State(
                        hasSeenOnboarding: hasSeenOnboarding,
                        tabState: initialTabState
                    ),
                    reducer: {
                        // _printChanges 메소드를 통해 액션을 감지하고 콘솔로 확인 가능
                        RootStore()
                            ._printChanges()
                    }
                )
            )
        }
    }
    
}
