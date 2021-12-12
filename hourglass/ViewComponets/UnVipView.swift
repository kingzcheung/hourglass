//
//  UnVipView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/12/12.
//

import SwiftUI

struct UnVipView: View {
    
    @Binding var isPr: Bool
    
    var body: some View {
        Button {
            isPr = !isPr
        } label: {
            HStack {
                Image("vip")
                
                VStack(alignment: .leading) {
                    Text("解锁高级版")
                        .multilineTextAlignment(.leading)
                    HStack {
                        Text("非高级版")
                            .multilineTextAlignment(.leading)
                        Image("NextArrow")
                    }.font(.caption)
                }
                Spacer()
            }
            .padding(.horizontal, 10.0)
            .padding(.vertical, 20.0)
        }

        
    }
}

struct UnVipView_Previews: PreviewProvider {
    static var previews: some View {
        UnVipView(isPr: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
