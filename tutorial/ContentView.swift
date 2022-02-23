//
//  ContentView.swift
//  tutorial
//
//  Created by hemant kumar on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var fetch = FetchToDo()
    var body: some View {
     
        VStack {
           
            List(fetch.todos) { todo in
                VStack {
                    HStack {
                        VStack (){
                            Text("Hello")
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .frame(width: 120, height: 160,alignment: .leading)
                                .background(Color(.systemBlue))
                                
                                
                        }
                        Spacer()
                        VStack (alignment: .leading,spacing:2){
                            Text(todo.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .padding()
                                
                        }
                        
                    }
                    .frame(height: 160)
                }
            }
           
        }
        .listRowInsets(EdgeInsets(top: -20, leading: -20, bottom: -20, trailing:-20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Todo: Codable,Identifiable {
    public var id: Int
    public var title: String
    public var completed: Bool
    
}


