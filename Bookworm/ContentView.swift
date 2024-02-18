//
//  ContentView.swift
//  Bookworm
//
//  Created by Насрулло Исмоилжонов on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack{
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
