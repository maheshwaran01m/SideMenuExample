//
//  SideMenuView.swift
//  SideMenuExample
//
//  Created by MAHESHWARAN on 30/03/24.
//

import SwiftUI

struct SideMenuView: View {
  
  @Binding var selectedTab: SideMenuOption
  @Binding var isPresented: Bool
  
  init(_ selectedTab: Binding<SideMenuOption>,
       isPresented: Binding<Bool>) {
    _selectedTab = selectedTab
    _isPresented = isPresented
  }
  
  var body: some View {
    GeometryReader { proxy in
      VStack(alignment: .leading) {
        
        Text("Menu")
          .font(.headline)
        
        List(SideMenuOption.allCases, id: \.self) { row in
          mainView(row)
            .padding(.horizontal, 8)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
        }
        .listStyle(.plain)
      }
      .padding(.horizontal, 10)
      .frame(width: proxy.size.width*0.6, alignment: .leading)
      .background(Color(uiColor: .systemBackground).shadow(.drop(radius: 1)))
    }
  }
  
  func mainView(_ row: SideMenuOption) -> some View {
    let isSelected = row == selectedTab
    
    return Button {
      selectedTab = row
      isPresented.toggle()
      
    } label: {
      HStack {
        Image(systemName: row.iconName)
          .resizable()
          .renderingMode(.template)
          .foregroundColor(isSelected ? .primary : .secondary)
          .frame(width: 26, height: 26)
        
        
        Text(row.title)
          .font(.headline)
          .foregroundColor(isSelected ? .primary : .secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    .listRowBackground(
      Group {
        if isSelected {
          LinearGradient(colors: [ .purple.opacity(0.5), .purple.opacity(0.2), .clear], startPoint: .leading, endPoint: .trailing)
        } else {
          Color.clear
        }
      }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.vertical, 4)
    )
  }
}

enum SideMenuOption: Int, CaseIterable {
  case home, favorite, settings
  
  var title: String {
    switch self {
    case .home: return "Home"
    case .favorite: return "Favorite"
    case .settings: return "Settings"
    }
  }
  
  var iconName: String {
    switch self {
    case .home: return "house"
    case .favorite: return "star"
    case .settings: return "gear"
    }
  }
}
