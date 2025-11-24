//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by aluno-15 on 17/11/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(for: Task.self)
    }
}
