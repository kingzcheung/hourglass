//
//  ContentView.swift
//  hourglass
//
//  Created by kingzcheung on 2021/11/14.
//

import SwiftUI
import CoreData

struct HourglassView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        ZStack {
                            NavigationLink(destination:
                                            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            ) {
                                EmptyView()
                            }
                            .opacity(0.0)
                            .buttonStyle(PlainButtonStyle())

                            HStack {
                                CardView()
                                    .shadow(color: Color(hue: 1.0, saturation: 0.0, brightness: 0.0, opacity: 0.05), radius: 4, x: 0, y: 4)
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .listRowSeparator(.hidden)
                    //.listRowBackground(Color("bg_color",bundle: nil))
            
            }
            
            }
            .toolbar {
            
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .listStyle(.plain)
            //.background(Color("bg_color",bundle: nil)
            //.edgesIgnoringSafeArea(.all))
            // bug??
            .navigationBarTitle(Text("Hourglass"))
            .navigationBarTitleDisplayMode(.large)
            
         }//.navigationViewStyle(.stack)
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct HourglassView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HourglassView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            HourglassView().preferredColorScheme(.dark).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
