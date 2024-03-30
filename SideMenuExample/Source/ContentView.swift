//
//  ContentView.swift
//  SideMenuExample
//
//  Created by MAHESHWARAN on 30/03/24.
//

import SwiftUI

struct ContentView: View {
  
  @State var isPresented = false
  @State var selectedTab = SideMenuOption.home
  
  var body: some View {
    SideMenuContentView($isPresented) {
      
      switch selectedTab {
      case .home:
        List(0..<20) { item in
          Text(item.description)
        }
        
      case .favorite:
        List(0..<20) { item in
          HStack {
            Image(systemName: "person.circle")
            Text(item.description)
          }
        }
        
      case .settings:
        VStack(alignment: .leading) {
          Image(systemName: "person.circle")
            .resizable()
            .frame(width: 70, height: 70)
          
          Text(selectedTab.title.description)
        }
      }
    }
    .overlay(alignment: .leading) {
      SideMenu($isPresented) {
        SideMenuView($selectedTab, isPresented: $isPresented)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
