//
//  ContentView.swift
//  SimpleTodo
//
//  Created by Noah Sadir on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoLogic: TodoViewModel
    @State var shouldShowAddView: Bool = false
    var test = ["Hello", "there"]
    
    // [1] Take a look at this function.
    //     This will fire when the "Demo" button is pressed.
    //     In the preview, click on Demo and look at the console output.
    func todoListDemo() {
        // A demonstration of how to interact with the view model
        todoLogic.reset()
        todoLogic.add(item: "Write an app")
        todoLogic.add(item: "Water plants")
        todoLogic.add(item: "Go to bed")
        todoLogic.add(item: "Unnecessary Task")
        todoLogic.edit(at: 2, toValue: "Eat dinner")
        todoLogic.delete(at: 2)
        todoLogic.delete(item: todoLogic.items[2])
        print("\nTO-DO ITEMS\n-----------")
        for item in todoLogic.items {
            // Note that list items are of type TodoItem.
            // If we want to get the text of the to-do item,
            // we need to use .description
            print(item.description)
        }
    }
    
    // Take a look at the structure of this view.
    // You don't need to worry about navigation or backend logic
    // stuff in this module, but you should observe how it works.
    var body: some View {
        NavigationStack {
            List {
                // [2] Use ForEach to list out the to-do items. For now, each item can be representad as a Text object
                // [3] Once you've confirmed that the ForEach structure works,
                //     replace the Text view with a TodoItemView.
                //     Hint 1: deleteAction is a closure
                //     Hint 2: Look at the demo function for deleting an item
                
                /* BEGIN YOUR CODE */
                ForEach(todoLogic.items, id: \.self) { item in
                    TodoItemView(item: item, deleteAction: {(todoItem) -> () in
                        todoLogic.delete(item: todoItem)
                    })
                }
                /* END YOUR CODE */
            }
            .navigationTitle("To-do List")
            .toolbar {
                Button("Demo") {
                    todoListDemo()
                }
                
                // How could we use this code to make an edit button
                // that presents an edit view 🤔
                Button("Add", systemImage: "plus") {
                    shouldShowAddView = true
                }
                .sheet(isPresented: $shouldShowAddView, content: {
                    // show add item view when add button is clicked
                    AddItemView(isVisible: $shouldShowAddView)
                })
            }
        }
    }
}
