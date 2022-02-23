//
//  ContentView.swift
//  tutorial
//
//  Created by hemant kumar on 22/02/22.
//

import SwiftUI



struct ContentView: View {
    @State private var firstname = ""

    @State private var lastname = ""
    @State private var birthdate = Date()
    @State private var shouldSendNewsLetter = false
    @State private var numberOfLikes = 1
    var body: some View {
        
        NavigationView {
            Form{
                Section(header: Text("Personal Information")) {
                    TextField("first name",text: $firstname)
                    TextField("first name",text: $lastname)
                    DatePicker("Birthday",selection: $birthdate,displayedComponents: .date)
                }
                Section(header: Text("Actions")){
                    Toggle("send newsLetter", isOn: $shouldSendNewsLetter)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    
                    Stepper("Number of likes",value: $numberOfLikes,in: 1...100)
                    Text("This video hase \(numberOfLikes) likes")
                    Link("Terms of Service", destination: URL(string: "https://google.com")! )
                }
               
        
                
            }.navigationTitle("Account").font(.headline)
                .accentColor(.red)
                .toolbar {
                    ToolbarItemGroup(placement:.navigationBarTrailing){
                        Button{
                           
                        }label: {
                            Image(systemName: "square.and.arrow.down")
                        }
                        Button("Save",action: saveUser)
                    }
                }
        }
     
    }
    func saveUser(){
        print("User Saved")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
