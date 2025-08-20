//
//  OnboardingView.swift
//  Onboarding
//
//  Created by 윤희슬 on 8/19/25.
//

import SwiftUI

import ComposableArchitecture
import DesignSystem

public struct OnboardingView: View {
    
    let contents: [Onboarding] = Onboarding.contents
    
    @State private var width: CGFloat = 0
    
    @State private var height: CGFloat = 0
    
    public let store: StoreOf<OnboardingStore>
    
    public init(store: StoreOf<OnboardingStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            GeometryReader { geometry in
                ZStack {
                    HappiaryBackgroundView()
                    
                    VStack(alignment: .center, spacing: 0) {
                        HStack(spacing: 0) {
                            ForEach(contents, id: \.mainTitle) { content in
                                showContent(for: content, viewStore: viewStore)
                                    .frame(width: width, height: height)
                            }
                        }
                        .offset(x:  -CGFloat(viewStore.currentStep - 1) * geometry.size.width + viewStore.dragOffset) // 현재 페이지 위치 + 드래그 중 위치
                        // Drag 중에는 애니메이션 제거, 페이지 전환 시 스프링
                        .animation(viewStore.dragOffset == 0
                                   ? .interactiveSpring(response: 0.35, dampingFraction: 0.8, blendDuration: 0.8)
                                   : .easeInOut,
                                   value: viewStore.currentStep)                        .contentShape(Rectangle()) // HStack 영역을 사각형으로 확장
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        viewStore.send(.onSwipe(value.translation.width))
                                    }
                                    .onEnded { _ in
                                        viewStore.send(.endSwipe(geometry.size.width))
                                    }
                            )
                        
                        Spacer()
                        
                        pageControl(currentStep: viewStore.currentStep, total: contents.count)
                    }
                    .frame(width: width, height: height)
                }
                .onAppear {
                    width = geometry.size.width
                    height = geometry.size.height
                }
            }
        }
    }
}

extension OnboardingView {
    
    func showContent(for content: Onboarding, viewStore: ViewStore<OnboardingStore.State, OnboardingStore.Action>) -> some View {
        VStack(alignment: .center, spacing: 50) {
            Text(content.mainTitle)
                .customTextStyle(
                    fontSize: 30,
                    lineLimit: 2,
                    multiLineAlignment: .center
                )
                .lineSpacing(15)
            
            Text(content.subTitle)
                .customTextStyle(
                    fontSize: 22,
                    lineLimit: 2,
                    multiLineAlignment: .center
                )
                .lineSpacing(10)
            
            if let image = content.image {
                image
                    .aspectRatio(contentMode: .fit)
            } else {
                HappiaryRoundedButton(
                    isEnable: .constant(true),
                    horizontalPadding: 52,
                    height: 42,
                    title: "go_to_record".localized(bundle: Bundle.module),
                    fontSize: 18
                ) {
                    viewStore.send(.goToMainTab) // 버튼 눌렀을 때 Action 전송
                }
            }
        }
        .padding(.top, 88)
        .padding(.bottom, 40)
    }
    
    func pageControl(currentStep: Int, total: Int) -> some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(currentStep == index ? Color.black : Color.strokeGray)
            }
        }
        .padding(.bottom, 80)
    }
    
}
