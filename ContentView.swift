//
//  ContentView.swift
//  DuoApp
//
//  Created by Baturalp Güvenç on 20.09.2023.
//

import SwiftUI

struct ContentView: View {
    // Video verileri modelim
    let videos = [
        VideoModel(videoName: "Video 1", ownerImageName: "sahip1", likeCount: 10, dislikeCount: 5),
        VideoModel(videoName: "Video 2", ownerImageName: "sahip2", likeCount: 8, dislikeCount: 2),
        // Diğer video modelleri buraya eklenecektir
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(videos, id: \.videoName) { video in
                    VStack {
                        // Videoların geleceği için kare alan
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 200) // Kare boyutunu ayarlama
                            .overlay(
                                Image(video.ownerImageName) // Profil resmi eklemek için resim adı ekleme (projeye eklenecek görseller)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50) // Profil resmi boyutunu ayarlama
                                    .padding(5)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                    .offset(y: -105) // Profil resmini kare alanın üstünde "dikey" olarak konumlandırmak için
                            )
                        
                        // Like ve dislike butonları ekleme
                        HStack(spacing: 30) {
                            Button(action: {
                                // Like butonuna tıklama işlemi
                                // Oy sayısı arttırma
                            }) {
                                Image(systemName: "hand.thumbsup.fill")
                                    .font(.title)
                            }
                            .foregroundColor(.blue)
                            
                            Button(action: {
                                // Dislike butonuna tıklama işlemi
                                // Burada oy sayısını azaltılıyor
                            }) {
                                Image(systemName: "hand.thumbsdown.fill")
                                    .font(.title)
                            }
                            .foregroundColor(.red)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Video için örnek bir usecase model

struct VideoModel {
    let videoName: String
    let ownerImageName: String
    var likeCount: Int
    var dislikeCount: Int
}

