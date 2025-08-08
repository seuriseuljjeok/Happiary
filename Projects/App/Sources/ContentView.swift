import SwiftUI

import ComposableArchitecture
import Core
import DesignSystem

public struct ContentView: View {
        
    let store: StoreOf<TabStore>
    
    @State private var text1 = ""
    
    @State private var isEnable = true
    
    @State private var isSelected = false
    
    @State private var isToggle = false

    public var body: some View {
        ZStack {
            HappiaryBackgroundView()
            
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
                
                HappiaryImageTextButton(
                    isSelected: $isSelected,
                    isEnable: true,
                    typeImage: .sweat,
                    type: "두근두근 설레는"
                )
                
                HappiaryImageTextButton(
                    isSelected: $isSelected,
                    typeImage: .warm,
                    type: "햇살처럼 따뜻한"
                )
                
                HappiarySettingMenuBox(title: "기록 알림 설정", menuType: .toggle(isOn: $isToggle))
                
                HappiarySettingMenuBox(title: "기록 알림 설정", menuType: .button(image: .icRightArrow, action: { print("기록 알림 설정") }))
                
                HappiarySettingMenuBox(title: "기록 알림 설정", menuType: .none)


            }
            
            HappiaryModal(
                mainTitle: "데이터를 초기화 하시겠어요?",
                subTitle: "한 번 초기화하면 다시 되돌릴 수 없어요",
                rightButtonText: "초기화"
            ) {
                print("초기화")
            }
        }
        .overlay(alignment: .top) {
            HappiaryNavigationBar(
                center: {
                    Text("Happiary")
                        .customTextStyle(alignment: .center, fontSize: 36)
                },
                right: {
                    Image.icPlus
                        .customImageStyle(width: 20, height: 20)
                }
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store(initialState: TabStore.State(selectedTab: .home), reducer: { TabStore() }))
    }
}
