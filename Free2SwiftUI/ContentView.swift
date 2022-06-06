//
//  ContentView.swift
//  Free2SwiftUI
//
//  Created by オナガ・ハルキ on 2022/06/06.
//

import SwiftUI

struct ContentView: View {
    @State var itemArray = [String]()
    @State var isShowingSheet = false
    
    var body: some View {
        NavigationView {
            List(itemArray, id: \.self) { item in
                Text(item)
            }
            .listStyle(.plain)
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }// Button
                }// ToolbarItem
            }// toolbar
            .sheet(isPresented: $isShowingSheet) {
                TextFieldView(itemArray: $itemArray)
            }// sheet
        }// NavigationView
    }
}

struct TextFieldView: View {
    @Binding var itemArray: [String]
    @Environment(\.dismiss) var dismiss
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("Enter new item", text: $text)
            Button {
                itemArray.append(text)
                dismiss()
            } label: {
                Text("Add Item")
            }// Button
        }// VStack
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
