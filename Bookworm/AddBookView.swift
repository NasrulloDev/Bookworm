//
//  AddBookView.swift
//  Bookworm
//
//  Created by Насрулло Исмоилжонов on 19/02/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    @State private var hasValidName = false
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review"){
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section{
                    Button("Save"){
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(!validator(title: title, author: author))
                }
            }
            .navigationTitle("Add Book")
        }
    }
    
    func validator(title: String, author: String) -> Bool {
        if title.replacingOccurrences(of: " ", with: "") == "" || author.replacingOccurrences(of: " ", with: "") == "" {
            return false
        }
        return true
    }
}

#Preview {
    AddBookView()
}
