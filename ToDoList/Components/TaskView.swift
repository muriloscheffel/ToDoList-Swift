//
//  TaskView.swift
//  ToDoList
//
//  Created by aluno-15 on 18/11/25.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle")
                    .foregroundStyle(task.isCompleted ? .accent : .gray3)
                    .frame(width: 22, height: 22)
            }
            Text(task.name)
                .foregroundStyle(.labelPrimary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 11)
        }
        .padding(.leading, 11)
    }
}

#Preview {
    TaskView(task: .constant(Task(name: "Almoçar", details: "no RU", category: .groceries, isCompleted: true)))
}
