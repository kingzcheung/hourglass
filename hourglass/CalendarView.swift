//
//  CalendarView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI


enum Flavor: String, CaseIterable, Identifiable {
    case chocolate
    case vanilla
    case strawberry

    var id: String { self.rawValue }
}

struct CalendarView: View {
    
//    var weeks = ["Su","Mo","Tu","We","Th","Fr","Sa"]
    var weeks = ["日","一","二","三","四","五","六"]
    var columns : [GridItem] = Array(repeating: .init(.flexible()), count: 7)
    @State var isPresented = false
    @State private var selectedFlavor = Flavor.chocolate
    @EnvironmentObject var calendarVM: CalendarVM
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    print("年月日")
                    print("?????\(calendarVM.day)")
                    self.isPresented = !self.isPresented
                } label: {
                    Text("\(calendarVM.toDate())")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .foregroundColor(Color("DayColor"))
                        
                }.popover(isPresented: $isPresented,  arrowEdge: .leading) {

                    DatePicker(
                            "Start Date",
                             selection: $date,
                             in: dateRange,
                             displayedComponents: [.date]
                        )
                    
                }
                
                
                Spacer()
                HStack {
                    Button {
                        print("Prev")
                        calendarVM.subMonth(1)
                        
                    } label: {
                        Image("PrevArrow")
                    }
                    .padding(.horizontal)
                    Button {
                        print("Next")
                        calendarVM.addMonth(1)
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
            
            LazyVGrid(columns: columns,spacing: 6) {
                ForEach(calendarVM.days(), id: \.self) { i in
                    DayView(dayIndex: i,isCurrent: .constant(i == calendarVM.day), currentVal: .constant(calendarVM.day))
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
