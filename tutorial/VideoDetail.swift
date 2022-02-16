//
//  VideoDetail.swift
//  tutorial
//
//  Created by hemant kumar on 16/02/22.
//

import SwiftUI

struct VideoDetail: View {
    var video : Video
    var body: some View {
       
        VStack(alignment:.center, spacing: 30) {
            Spacer()
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:150)
            .cornerRadius(20)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing:40){
                Label("\(video.viewCount)",systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                     
            }
                
            Text(video.description)
            .font(.body)
        .padding()
            
            Spacer()
            
            Link(destination: video.url, label: {
                Text("Watch Now ")
                    .bold()
                    .font(.title2)
                    .frame(width: 300, height: 50)
                    .background(Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            Spacer()
        }
        
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: VideoList.topTen.first!)
    }
}
