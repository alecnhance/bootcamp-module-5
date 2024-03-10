//
//  AddItemView.swift
//  SimpleTodo
//
//  Created by Noah Sadir on 2/18/24.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var todoLogic: TodoViewModel
    @Binding var isVisible: Bool
    
    @State var text: String = ""
    
    var body: some View {
        // Well isn't this ugly...
        // Maybe we can make this look a little better.
        
        // [5] Add a "cancel" button. You should be able to adapt
        //     the code provided for the add button.
        // [6] Add the necessary views & view modifiers to make
        //     AddItemView conform to the guideline image
        
        /* BEGIN YOUR CODE */
        Text("Add Item")
            .font(.title)
        TextField("Item description", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 32)
        HStack{
            Button(action: {
                todoLogic.add(item: text)
                isVisible = false
            }, label: {
                Text("Add")
                    .frame(maxWidth: .infinity)
            }).buttonStyle(.borderedProminent)
                .tint(.green)
                .padding(.leading, 32)
            Button(action: {
                isVisible = false
            }, label: {
                Text("Cancel").frame(maxWidth: .infinity)
            }).buttonStyle(.borderedProminent)
                .tint(.blue)
                .padding(.trailing, 32)
        }
        Spacer()
        /* END YOUR CODE */
    }
}

#Preview {
    AddItemView(isVisible: .constant(true))
}
