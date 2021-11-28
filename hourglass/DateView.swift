//
//  DateView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                CalendarView().padding(.top).listRowSeparator(.hidden)
            }
            
            .listStyle(.plain)
            .listRowBackground(Color("bg_color",bundle: nil).edgesIgnoringSafeArea(.all))
            .navigationTitle(Text("日历")).navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
                
        }
        
        
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
            .previewDevice("iPhone 12 mini")
    }
}
