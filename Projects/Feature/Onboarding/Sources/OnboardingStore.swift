//
//  OnboardingStore.swift
//  Onboarding
//
//  Created by 윤희슬 on 8/4/25.
//

import Foundation

import ComposableArchitecture


public struct OnboardingStore: Reducer {
    
    public struct State: Equatable {
        
        public var currentStep: Int = 0
        
        public var dragOffset: CGFloat = 0
                        
        public init(currentStep: Int, dragOffset: CGFloat) {
            self.currentStep = currentStep
            self.dragOffset = dragOffset
        }
                
    }
    
    public enum Action: Equatable {
        
        case onSwipe(CGFloat)
        
        case endSwipe(CGFloat)
                
        case goToMainTab
        
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
                
        Reduce { state, action in
            switch action {
            case .onSwipe(let dragOffset):
                state.dragOffset = dragOffset
                return .none
                
            case .endSwipe(let width):
                if state.dragOffset < -width / 4 && state.currentStep < 2 {
                    state.currentStep += 1
                } else if state.dragOffset > width / 4 && state.currentStep > 0 {
                    state.currentStep -= 1
                }
                state.dragOffset = 0
                return .none
                
            case .goToMainTab:
                print("move to home")
                return .none
            }
        }
        
    }
    
    
}
