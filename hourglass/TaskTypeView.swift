//
//  TaskTypeView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/14.
//

import SwiftUI

struct TaskTypeView: View {
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "sport")!)
                .padding(10)
        }
    }
}

struct TaskTypeView_Previews: PreviewProvider {
    static var previews: some View {
        TaskTypeView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
