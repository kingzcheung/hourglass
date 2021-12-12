//
//  SettingView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/23.
//

import SwiftUI

struct SettingView: View {
    
    @State var isPresented = false
    
    var body: some View {
        List {
            Section{
                UnVipView(isPr: $isPresented)
                    .sheet(isPresented: $isPresented, onDismiss: nil) {
                    PurchaseView()
                }
                
            }
            Section {
                Text("应用图标")
            } header: {
                Text("通用").font(.callout)
            }
            Section {
                Text("小组件样式")
                Text("添加小组件到桌面")
            } header: {
                Text("小组件").font(.callout)
            }
            Section {
                Text("联系我们")
                Text("鼓励我们")
                Text("分享给朋友")
            } header: {
                Text("支持我们").font(.callout)
            }
            Section {
                Text("关于应用")
            } header: {
                Text("关于").font(.callout)
            }

        }.listStyle(.automatic)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
