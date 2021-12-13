//
//  ContentView.swift
//  Sample01
//
//  Created by LeoAndo on 2021/12/14.
//

import SwiftUI

struct ContentView: View {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    @State private var todos: [Todo] = []
    @State private var isFetching = false
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
                    NavigationLink {
                        DetailScreen(title: todo.title)
                    } label: {
                        TodoRow(title: todo.title, completed: todo.completed)
                    }
                }.onDelete(perform: deleteItem)
            }
            .refreshable(action: {
                await fetchTodos()
            })
            .navigationTitle("Sample01")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    func fetchTodos() async {
        let session = URLSession(configuration: .default)
        do {
            let task = try await session.data(from: url)
            let todos = try JSONDecoder().decode([Todo].self, from: task.0)
            self.todos = todos
        } catch {
            print("error...")
        }
    }
}

struct Todo: Identifiable, Decodable {
    var id: Int
    var title: String
    var completed: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
