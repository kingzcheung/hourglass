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
    
    private let size = 36.0
    
    var body: some View {
        VStack {
            ZStack {
                Button {
                    print("\(dayIndex)")
                } label: {
                    if isCurrent {
                        Text("\(dayIndex)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: size, idealWidth: size, maxWidth: size, minHeight: size, idealHeight: size, maxHeight: size, alignment: .center)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(size / 2)
                            .font(.callout)
                        
                    }else {
                    Text("\(dayIndex)")
                        .multilineTextAlignment(.center)
                        .frame(width: size, height: size, alignment: .center)
                        .foregroundColor(.black)
                        .font(.callout)
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
