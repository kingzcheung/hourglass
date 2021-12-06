//
//  DateView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct DateView: View {
    
    @StateObject var calenderVM: CalendarVM = CalendarVM()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    CalendarView()
                        .padding(.top)
                        .listRowSeparator(.hidden)
                        .onAppear {
                            print("calenderVM.day->\(calenderVM.day)")
                        }.environmentObject(calenderVM)
                }
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
