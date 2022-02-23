//
//  FetchToDo.swift
//  tutorial
//
//  Created by hemant kumar on 23/02/22.
//

import Foundation

class FetchToDo: ObservableObject {
    
    @Published var todos = [Todo]()
    
    init() {
            let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
            // 2.
            URLSession.shared.dataTask(with: url) {(data, response, error) in
                do {
                    if let todoData = data {
                        // 3.
                        let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                        DispatchQueue.main.async {
                            self.todos = decodedData
                        }
                    } else {
                        print("No data")
                    }
                } catch {
                    print("Error")
                }
            }.resume()
        }
    }
