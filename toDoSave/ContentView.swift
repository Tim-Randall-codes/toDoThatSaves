//
//  ContentView.swift
//  toDoSave
//
//  Created by Tim Randall on 14/7/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var taskName: String = ""
    var body: some View {
        HStack{
            TextField("Task Name", text:$taskName)
            Button(action: {
                self.addTask()
            }){
                Text("add task")
            }
            }
        }
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
