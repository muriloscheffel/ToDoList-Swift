//
//  AddTask.swift
//  ToDoList
//
//  Created by aluno-15 on 21/11/25.
//

import SwiftUI

struct AddTask: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    @State var details: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Task")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal)
                        TextField("Your task name here", text: $name)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
            
                    
                    // category
                    
                    
                    // details
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.system(.subheadline, weight: .semibold))
                            .padding(.horizontal)
                        TextField("More details about the task", text: $details, axis: .vertical)
                            .lineLimit(5...10)
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 26)
                                    .foregroundStyle(.backgroundTertiary)
                            )
                    }
                }
            }
            .padding(.top)
            .padding(.horizontal)
            .background(.backgroundSecondary)
            .navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                        // salvar tarefa
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    AddTask()
}
