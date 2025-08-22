import SwiftUI

import ComposableArchitecture
import Core
import Feature


@main
struct HappiaryApp: App {
    
    var body: some Scene {
        
        let hasSeenSplash = UserDefaults.standard.bool(forKey: "hasSeenSplash")
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        let initialTabState = hasSeenOnboarding ? TabStore.State(selectedTab: .home) : nil
        
        // Step 5. Store는 기능이 시작되기를 원하는 초기 상태 뿐만 아니라, 기능을 구동하는 Reducer를 지정하는 후행 클로저를 제공함으로써 구성할 수 있음
        let rootStore = Store(
            initialState: RootStore.State(
                hasSeenSplash: hasSeenSplash,
                hasSeenOnboarding: hasSeenOnboarding,
                tabState: initialTabState
            ),
            reducer: {
                RootStore()._printChanges()
            }
        )

        WindowGroup {
            RootView(store: rootStore)
        }
        
    }
    
}
