//
//  CalendarView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct CalendarView: View {
    
//    var weeks = ["Su","Mo","Tu","We","Th","Fr","Sa"]
    var weeks = ["日","一","二","三","四","五","六"]
    var columns : [GridItem] = Array(repeating: .init(.flexible()), count: 7)

    @EnvironmentObject var calendarVM: CalendarVM
    
    var days: [Int]  {
        
        let calendar = Calendar.current
        
        let dc = calendar.dateComponents([.year,.month,.day], from: Date())
        
        var month = Month.init(dateComponents: dc)
        
        return month.toDays()
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    print("年月日")
                    print("?????\(calendarVM.day)")
                } label: {
                    Text("2021年11月28日")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(Color("DayColor"))
                        
                }

                Spacer()
                HStack {
                    Button {
                        print("Prev")
                        calendarVM.month -= 1
                        
                    } label: {
                        Image("PrevArrow")
                    }
                    .padding(.horizontal)
                    Button {
                        print("Next")
                        calendarVM.month += 1
                    } label: {
                        Image("NextArrow")
                    }
                    .padding(.horizontal)

                }
                
            }
            .padding(.bottom, 10.0)
            HStack{
                ForEach(weeks.indices,id: \.self) { i in
                    Spacer()
                    Text(weeks[i])
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
            }
            
            LazyVGrid(columns: columns,spacing: 5) {
                ForEach(days.indices, id: \.self) { i in
                    DayView(dayIndex: days[i],isCurrent: .constant(days[i] == calendarVM.day), currentVal: .constant(calendarVM.day))
                        .environmentObject(calendarVM)
                }
            }
            
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CalendarView()
                .previewLayout(.fixed(width: 475, height: 320.0))
                .environmentObject(CalendarVM.init())
            CalendarView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 475, height: 320.0))
                .environmentObject(CalendarVM.init())
        }
    }
}
