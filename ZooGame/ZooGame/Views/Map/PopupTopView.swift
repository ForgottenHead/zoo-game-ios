//
//  PopupTopView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 13/01/2023.
//

import SwiftUI

struct PopupTopView: View {
    var animalName: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("AccentColor"))
            
            HStack(spacing: 0) {
                Image(systemName: "pawprint")
                    .aspectRatio(1.0, contentMode: .fit)
                    .cornerRadius(16)
                    .padding(16.0)
                
                VStack(alignment: .leading, spacing: 8) {
                    Group {
                        Text("Pre ")
                            .foregroundColor(.primary.opacity(0.6)) +
                        Text(animalName)
                            .bold()
                            .foregroundColor(.primary)
                        Text("bol vykonany Check-in!")
                            .foregroundColor(.primary.opacity(0.6))
                    }
                  
                }
                
                Spacer()
            }
        }
        .frame(height: 98)
        .padding(.horizontal, 16)
    }
}

struct PopupTopView_Previews: PreviewProvider {
    static var previews: some View {
        PopupTopView(animalName: "Surikata?")

    }
}
