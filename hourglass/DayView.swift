//
//  DayView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct DayView: View {
    
    @State var dayIndex: Int
    @Binding var isCurrent:Bool
    @Binding var currentVal: Int
    
    private let size = 36.0
    
    var body: some View {
        VStack {
            ZStack {
                Button {
                    print("\(dayIndex)")
                    self.$currentVal.wrappedValue = dayIndex
                } label: {
                    if isCurrent {
                        Text(dayIndex == 0 ? " " : "\(dayIndex)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: size, idealWidth: size, maxWidth: size, minHeight: size, idealHeight: size, maxHeight: size, alignment: .center)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(size / 2)
                            .font(.callout)
                        
                    }else {
                    Text(dayIndex == 0 ? " " : "\(dayIndex)")
                        .multilineTextAlignment(.center)
                        .frame(width: size, height: size, alignment: .center)
                        .foregroundColor(Color("DayColor"))
                        .font(.callout)
                    }
                }

                
                
            }
            
        }
        
    }
}

struct DayView_Previews: PreviewProvider {

    @State static var current = true
        
    static var previews: some View {
        Group {
            DayView(dayIndex: 11, isCurrent: $current,currentVal: .constant(11))
                .previewLayout(.fixed(width: 100.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            DayView(dayIndex: 11, isCurrent: $current,currentVal: .constant(1))
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            DayView(dayIndex: 11, isCurrent: $current,currentVal: .constant(1))
                .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
                .preferredColorScheme(.dark)
        }
        
    }
}
