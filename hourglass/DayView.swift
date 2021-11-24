//
//  DayView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/24.
//

import SwiftUI

struct DayView: View {
    
    @State var dayIndex: Int
    @State var isCurrent:Bool = false
    
    
    var body: some View {
        VStack {
            ZStack {
                Button {
                    print("\(dayIndex)")
                } label: {
                    if isCurrent {
                        Text("\(dayIndex)")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 30, idealWidth: 30, maxWidth: 30, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .center)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }else {
                    Text("\(dayIndex)")
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 30, idealWidth: 30, maxWidth: 30, minHeight: 30, idealHeight: 30, maxHeight: 30, alignment: .center)
                        .foregroundColor(.black)
                    }
                }

                
                
            }
            
        }
        
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(dayIndex: 11,isCurrent: true)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
