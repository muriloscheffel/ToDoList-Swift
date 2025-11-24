//
//  Tasks.swift
//  ToDoList
//
//  Created by aluno-15 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    @State var tasks: [Task] = [
        Task(name: "Tomar café da manhã", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "Tomar café da manhã", details: "no RU", category: .groceries, isCompleted: false),
        Task(name: "Ir pra academia", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "Ir pra academia", details: "no RU", category: .fitness, isCompleted: false),
        Task(name: "Ir pra aula", details: "em casa", category: .education, isCompleted: false),
        Task(name: "Ir pra aula", details: "em casa", category: .education, isCompleted: false),
        Task(name: "Ir pra aula", details: "em casa", category: .education, isCompleted: false),
        Task(name: "Estudar pra prova", details: "em casa", category: .education, isCompleted: false)
    ]
    
    @State var addTask: Bool = false
    
    var groupedTasks: [TaskCategory: [Binding<Task>]] {
        Dictionary(grouping: $tasks, by: { $0.category.wrappedValue })
    }
    
    var sortedCategories: [TaskCategory] {
        groupedTasks.keys.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                if tasks.isEmpty {
                    EmptyStateView(addTask: $addTask)
                } else {
                    
                    List(sortedCategories) { category in
                        
                        // header
                        HeaderView(taskCategory: category)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden, edges: .top)
                            .padding(.top, 20)
                        
                        if let categoryTasks = groupedTasks[category] {
                            
                            ForEach(categoryTasks) { task in
                                TaskView(task: task)
                                    .listRowInsets(EdgeInsets())
                                    .listRowSeparator(task.id == categoryTasks.last!.id ? .hidden : .visible, edges: .bottom)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding()
                }
            }
            
            .sheet(isPresented: $addTask, content: {
                AddTask()
                    .presentationDragIndicator(.visible)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        addTask = true
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            
        }
        
        
        
    }
}

#Preview {
    Tasks()
}
