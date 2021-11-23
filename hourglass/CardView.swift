//
//  CardView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/14.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {

                Image(uiImage: UIImage(named: "sport")!)
                    .padding(10)
                VStack(alignment: .leading) {
                    Text("Run 500 step")
                        .fontWeight(.medium)
                        .font(.subheadline)
                        .foregroundColor(Color("main_title_color"))
                        .multilineTextAlignment(.leading)
                        
                    
                    Text("It has four milstone to losing 6 pounds,It has four milstone to losing 6 pounds")
                        .font(.caption)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.009, brightness: 0.845))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                }.padding(.vertical, 10)
                Spacer()
            }
        }
        .background(Color("card_bg_color"))
        .cornerRadius(10)
            
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView()
                .previewLayout(.fixed(width: 375.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            .background(.gray)
            CardView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
                .background(.gray)
        }
            
    }
}
