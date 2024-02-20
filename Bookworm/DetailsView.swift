//
//  DetailsView.swift
//  Bookworm
//
//  Created by Насрулло Исмоилжонов on 20/02/24.
//
import SwiftData
import SwiftUI

struct DetailsView: View {
    let book: Book
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottomTrailing){
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
                
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Example Book", author: "Example Author", genre: "Fantasy", review: "It was a great book, and I really enjoyed it", rating: 5)
        
        return DetailsView(book: example)
            .modelContainer(container)
    } catch{
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
    
}
