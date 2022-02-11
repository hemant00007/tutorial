//
//  ContentView.swift
//  tutorial
//
//  Created by hemant kumar on 11/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
  
    @State var index = 0;
    var body: some View{
        VStack {
            HStack{
                Text("START")
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
            }.padding(.horizontal)
            HStack( spacing: 0){
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,30)
                    .background(Color("Color").opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index=0
                        }
                       
                    }
                Spacer(minLength: 0)
                
                Text("Month")
                    .foregroundColor(self.index == 1 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,20)
                    .background(Color("Color").opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index=1
                        }
                    }
                Spacer(minLength: 0)
                
                Text("Year")
                    .foregroundColor(self.index == 2 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .padding(.horizontal,30)
                    .background(Color("Color").opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index=2
                        }
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.top,10)
            .padding(.horizontal)
            
            TabView(selection:self.$index){
                GridView(fitness_Data: fit_Data)
                    .tag(0)
                GridView(fitness_Data: week_fit_Data)
                    .tag(1)
                VStack{
                    Text("monthly data not found")
                }.tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
           
            
          
            Spacer(minLength: 0)
    
        }.padding(.top)
    }
}
struct GridView : View {
    var columns = Array(repeating:GridItem(.flexible(),spacing: 50),count: 2)
    var fitness_Data : [Fitness]
    var body: some View {
        LazyVGrid(columns: columns,spacing: 30){
            ForEach(fit_Data){
                fitness in
                ZStack(alignment: Alignment(horizontal: .trailing,vertical: .top)){
                    VStack(alignment: .leading, spacing: 15){
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top,10)
                        HStack {
                            Spacer(minLength: 0)
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    }.padding()
                        .background(Color.pink)
                        .cornerRadius(30)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                }
            }
        }.padding(.horizontal)
            .padding(.top,25)
    }
}

struct Fitness : Identifiable {
    var id : Int
    var title : String
    var data : String
    var suggest : String
}

var fit_Data = [
    Fitness(id:0,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy"),
    Fitness(id:1,title: "Sleep",data:"133 bmp",suggest: "60-120\nffd dfealthy"),
    Fitness(id:2,title: "Energy Burn",data:"323 bmp",suggest: " Daily goad 120 kcal"),
    Fitness(id:3,title: "steps",data:"12,134",suggest: "daily goad 12200 steps"),
    Fitness(id:4,title: "Running",data:"54 KM",suggest: "10 KM"),
    Fitness(id:5,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy")
    
]
var week_fit_Data = [

    Fitness(id:0,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy"),
    Fitness(id:1,title: "Sleep",data:"133 bmp",suggest: "60-120\nffd dfealthy"),
    Fitness(id:2,title: "Energy Burn",data:"323 bmp",suggest: " Daily goad 120 kcal"),
    Fitness(id:3,title: "steps",data:"12,134",suggest: "daily goad 12200 steps"),
    Fitness(id:4,title: "Running",data:"54 KM",suggest: "10 KM"),
    Fitness(id:5,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy")
]

var monthly_fit_Data = [

    Fitness(id:0,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy"),
    Fitness(id:1,title: "Sleep",data:"133 bmp",suggest: "60-120\nffd dfealthy"),
    Fitness(id:2,title: "Energy Burn",data:"323 bmp",suggest: " Daily goad 120 kcal"),
    Fitness(id:3,title: "steps",data:"12,134",suggest: "daily goad 12200 steps"),
    Fitness(id:4,title: "Running",data:"54 KM",suggest: "10 KM"),
    Fitness(id:5,title: "heart rate",data:"123 bmp",suggest: "60-120\nHealthy")
]

