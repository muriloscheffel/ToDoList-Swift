//
//  HeaderView.swift
//  ToDoList
//
//  Created by aluno-15 on 18/11/25.
//

import SwiftUI

struct HeaderView: View {
    
    var taskCategory: TaskCategory
    
    var body: some View {
        Text(taskCategory.rawValue.uppercased())
            .foregroundStyle(.labelSecondary)
            .font(.system(.subheadline, weight: .semibold))
            .padding(.vertical, 11)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HeaderView(taskCategory: .education)
}
