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
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack{
            List(students){ student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar{
                Button("Add"){
                    let firstNames = ["Nasrullo", "Jamshid", "Zaman", "Ulugbek", "Fazliddin"]
                    let lastNames = ["Duysenbaev", "Baxromov", "Ismoiljonov", "Nizomhujaev", "Mavlonov"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenLastName) \(chosenFirstName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
