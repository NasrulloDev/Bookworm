//
//  ContentView.swift
//  Bookworm
//
//  Created by Насрулло Исмоилжонов on 18/02/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationStack{
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add book", systemImage: "plus"){
                            showingAddView.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddView){
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
