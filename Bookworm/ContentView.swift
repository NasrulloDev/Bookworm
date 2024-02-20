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
            List{
                ForEach(books){ book in
                    NavigationLink(value: book){
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading){
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailsView(book: book)
            }
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
