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
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
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
                                    .foregroundStyle(book.rating < 2 ? .red : .black)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailsView(book: book)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
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
    
    func deleteBook(at offsets: IndexSet){
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
    
}

#Preview {
    ContentView()
}
