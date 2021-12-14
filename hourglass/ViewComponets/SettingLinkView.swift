//
//  SettingLinkView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/12/13.
//

import SwiftUI

struct SettingLinkView: View {
    
    @State var iconName: String
    @State var titleLabel:String
    
    var body: some View {
        HStack {
            Image(iconName)
            Text(titleLabel)
            Spacer()
        }
        .padding(.vertical,10)
    }
}

struct SettingLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLinkView(iconName: "app",titleLabel: "this is a title")
            .previewLayout(.sizeThatFits)
    }
}
