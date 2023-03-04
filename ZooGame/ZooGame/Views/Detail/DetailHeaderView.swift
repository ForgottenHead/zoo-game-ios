//
//  DetailHeaderView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 09/01/2023.
//

import SwiftUI

struct DetailHeaderView: View {
    var image: String
    @State private var isAnimatingImage: Bool = false
    
    var body: some View {
        ZStack{
            
            Image(image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
                
            
        }
        .frame(height: 440)
        .onAppear(){
            withAnimation(.easeOut(duration: 0.5)){
                isAnimatingImage = true
            }
        }
    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(image: "surikata")
    }
}
