//
//  CalendarView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct CalendarView: View {
    
    var weeks = ["Su","Mo","Tu","We","Th","Fr","Sa"]
    var columns : [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    
    
    var body: some View {
        VStack {
            HStack{
                ForEach(weeks.indices,id: \.self) { i in
                    Spacer()
                    Text(weeks[i])
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
            
            LazyVGrid(columns: columns,spacing: 10) {
                ForEach((1...30), id: \.self) { i in
                    DayView(dayIndex: i,isCurrent: true)
                }
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .previewLayout(.fixed(width: 475, height: 300.0))
    }
}
