//
//  PosterDetails.swift
//  PagePeelSwipe
//
//  Created by Elaidzha Shchukin on 14.04.2024.
//

import SwiftUI

struct PosterDetails: View {
    @State var selected = ""
    
    var body: some View {
        VStack {
            Image("cap")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .frame(height: 400)
            
            VStack {
                VStack(spacing: 10) {
                    Text("Captian America")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 15) {
                        HStack {
                            Image(systemName: "star.fill")
                                .bold()
                            Text("4.0")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                        }
                        
                        HStack {
                            Image(systemName: "clock")
                                .bold()
                            Text("120 min")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                        }
                        
                        HStack {
                            Image(systemName: "film")
                                .bold()
                            Text("IMAX")
                                .font(.system(size: 15, weight: .medium, design: .rounded))
                        }
                    }
                    
                    Divider()
                        .padding(.vertical, 10)
                    
                    Text("Captain America is a superhero created by Joe Simon and Jack Kirby who appears in American comic books published by Marvel Comics.")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                    
                }
                .padding()
                .background(Color.black.opacity(0.7))
                .cornerRadius(20)
                
                HStack(spacing: 10) {
                    ForEach(dates) { i in
                        Button(action: {
                            self.selected = i.date
                        }, label: {
                            VStack(spacing: 5) {
                                Text(i.day)
                                Text(i.date)
                            }
                            .padding()
                        })
                        .foregroundColor(self.selected == i.date ? Color.black : Color.white)
                        .background(self.selected == i.date ? Color.white : Color.clear)
                        .cornerRadius(20)
                    }
                }
                .padding(.vertical, 5)
                
                HStack(spacing: 15) {
                    Text("$25")
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Book Now")
                            .padding(.vertical, 13)
                            .padding(.horizontal, 14)
                    })
                    .foregroundColor(.black)
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .padding(.top, 15)
                
                Spacer()
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
        }
    }
}

#Preview {
    PosterDetails()
        .preferredColorScheme(.dark)
}
