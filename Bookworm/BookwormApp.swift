//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Насрулло Исмоилжонов on 18/02/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
