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
    @State var category: TaskCategory? = nil
    @State var details: String = ""
    
    @State var missingInfo: Bool = false
    
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
                    HStack(spacing: 12) {
                        Image(systemName: category?.imageName ?? "list.bullet")
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background(
                                RoundedRectangle(cornerRadius: 7)
                                    .foregroundStyle(.accent)
                            )
                        Text("Category")
                            .padding(.vertical, 11)
//                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        Menu {
                            ForEach(TaskCategory.allCases) { category in
                                Button(category.rawValue, systemImage: category.imageName) {
                                    self.category = category
                                }
                            }
                        } label: {
                            HStack {
                                Text(category?.rawValue ?? "Select")
                                Image(systemName: "chevron.up.chevron.down")
                            }
                        }
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 26)
                            .foregroundStyle(.backgroundTertiary)
                    )
                    
                    
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
            .alert("Missing Infos", isPresented: $missingInfo, actions: {
                Button("OK", role: .cancel) {}
            })
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "paperplane") {
                     
                        if let category, !name.isEmpty, !details.isEmpty {
                            // salvar tarefa
                        } else {
                            missingInfo = true
                        }
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
