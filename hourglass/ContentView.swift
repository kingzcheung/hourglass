//
//  ContentView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/14.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var tabIndex = 1

    var body: some View {
        TabView(selection: $tabIndex) {
            HourglassView().tabItem {
                
                if tabIndex == 1 {
                    Image("HourglassActive")
                }else {
                    Image("Hourglass")
                }
                
            }.tag(1)
            DateView().tabItem {
                if tabIndex == 2 {
                    Image("CalendarActive")
                }else {
                    Image("Calendar")
                }
                
            }.tag(2)
            SettingView().tabItem {
                if tabIndex == 3 {
                    Image("SettingActive")
                }else {
                    Image("Setting")
                }
            }.tag(3)
        }.font(.headline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            ContentView().preferredColorScheme(.dark).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
