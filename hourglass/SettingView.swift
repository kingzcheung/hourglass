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
        NavigationView {
            List {
                Section{
                    UnVipView(isPr: $isPresented)
                        .sheet(isPresented: $isPresented, onDismiss: nil) {
                        PurchaseView()
                    }
                    
                }
                Section {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        SettingLinkView(iconName: "app", titleLabel: "应用图标")
                    }

                } header: {
                    Text("通用").font(.callout)
                }
                Section {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        SettingLinkView(iconName: "widget", titleLabel: "小组件样式")
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        SettingLinkView(iconName: "tips", titleLabel: "添加小组件到桌面")
                    }
                } header: {
                    Text("小组件").font(.callout)
                }.listRowSeparator(.hidden)
                Section { 
                    SettingLinkView(iconName: "contact", titleLabel: "联系我们")
                    SettingLinkView(iconName: "likeus", titleLabel: "鼓励我们")
                    SettingLinkView(iconName: "share", titleLabel: "分享给朋友")
                } header: {
                    Text("支持我们").font(.callout)
                }.listRowSeparator(.hidden)
                Section {
                    SettingLinkView(iconName: "about", titleLabel: "关于应用")
                } header: {
                    Text("关于").font(.callout)
                }

            }.listStyle(.automatic)
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
