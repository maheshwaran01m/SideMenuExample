//
//  SideMenu.swift
//  SideMenuExample
//
//  Created by MAHESHWARAN on 30/03/24.
//

import SwiftUI

struct SideMenu<V: View>: View {
  
  @Binding var isShowing: Bool
  
  var content: V
  var animation: Animation
  var transition: AnyTransition = .move(edge: .leading)
  
  init(_ isShowing: Binding<Bool>,
       animation: Animation = .easeInOut,
       transition: AnyTransition = .move(edge: .leading),
       @ViewBuilder content: @escaping () -> V) {
    
    _isShowing = isShowing
    self.animation = animation
    self.transition = transition
    self.content = content()
  }
  
  var body: some View {
    mainView
      .animation(animation, value: isShowing)
  }
  
  @ViewBuilder
  private var mainView: some View {
    if isShowing {
      
      ZStack(alignment: .bottom) {
        Color.black
          .opacity(0.0001)
          .onTapGesture {
            isShowing.toggle()
          }
          .ignoresSafeArea(.container)
        
        content
      }
      .transition(transition)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
  }
}
