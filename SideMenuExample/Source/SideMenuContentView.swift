//
//  SideMenuContentView.swift
//  SideMenuExample
//
//  Created by MAHESHWARAN on 30/03/24.
//

import SwiftUI

struct SideMenuContentView<V: View>: View {
  
  @Binding var isPresented: Bool
  
  let content: V
  
  init(_ isPresented: Binding<Bool>,
       @ViewBuilder content: @escaping () -> V) {
    _isPresented = isPresented
    self.content = content()
  }
  
  var body: some View {
    ZStack {
      Color.primary.opacity(0.001)
        .ignoresSafeArea(.container)
      
      content
    }
    .safeAreaInset(edge: .top, alignment: .leading, content: sideMenu)
  }
  
  private func sideMenu() -> some View {
    Button {
      isPresented.toggle()
    } label: {
      Image(systemName: "line.3.horizontal")
        .font(.largeTitle)
    }
    .padding(.horizontal)
  }
}
