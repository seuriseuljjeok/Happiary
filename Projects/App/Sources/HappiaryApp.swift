import SwiftUI

@main
struct HappiaryApp: App {
    
    init() {
        for family in UIFont.familyNames.sorted() {
            print("📌 Font family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("    → \(name)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
