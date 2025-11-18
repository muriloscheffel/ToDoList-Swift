//
//  Tasks.swift
//  ToDoList
//
//  Created by aluno-15 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    var tasks: [Task] = [
        Task(name: "Tomar café da manhã", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "Almoçar", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "Jantar", details: "em casa", category: .groceries, isCompleted: false)
    ]
    
    var body: some View {
        
        if tasks.isEmpty {
            EmptyStateView()
        } else {
            
            List(tasks) { task in
                TaskView(task: task)
                    .listRowInsets(EdgeInsets())
            } .listStyle(.plain)
        }
        
        
        
    }
}

#Preview {
    Tasks()
}
