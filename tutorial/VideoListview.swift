//
//  ContentView.swift
//  tutorial
//
//  Created by hemant kumar on 11/02/22.
//

import SwiftUI

struct VideoListview: View {
    
    var videos:[Video] = VideoList.topTen
    var body: some View {
        
        NavigationView{
            
            List(videos,id:\.id){ video in
                NavigationLink(destination:VideoDetail(video: video),label: {
                    HStack{
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(5)
                            .padding(.vertical,5)
                        
                        VStack(alignment:.leading,spacing: 2) {
                            Text(video.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            Text("January 1,2022")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                       
                    }
                })
               
                }.navigationTitle("Hemant app")
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListview()
    }
}

