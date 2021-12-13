//
//  TodoRow.swift
//  Sample01
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct TodoRow: View {
    var title: String
    var completed: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(title)
                .font(.title)
                .foregroundColor(Color.black)
            Text(completed ? "completed" : "has not completed")
                .font(.subheadline)
                .foregroundColor(Color.green)
        })
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(title: "delectus aut autem", completed: false)
    }
}
