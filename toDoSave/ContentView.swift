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
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.dateAdded, ascending: false)],
        predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
    ) var notCompletedTasks: FetchedResults<Task>
    var body: some View {
        VStack{
            HStack{
                TextField("Task Name", text:$taskName)
                Button(action: {
                    self.addTask()
                }){
                Text("add task")
            }
            }
            List {
                Text("HI")
            }
        }
    }
    func addTask() {
        let newTask = Task(context: viewContext)
        newTask.id = UUID()
        newTask.isComplete = false
        newTask.name = taskName
        newTask.dateAdded = Date()
        
        do {
        try viewContext.save()
        } catch {
        print(error)
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
