//
//  Tasks.swift
//  ToDoList
//
//  Created by aluno-15 on 18/11/25.
//

import SwiftUI

struct Tasks: View {
    
    var tasks: [String] = [
        "almoçar", "comprar comida", "comprar roupa"
    ]
    
    var body: some View {
 
        List(tasks, id: \.self) { task in
            Text(task)
        }
        
    }
}

#Preview {
    Tasks()
}
