//
//  RowComponent.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import SwiftUI

struct RowComponent: View {
    var animal: Animal
    var body: some View {
        
        
        HStack{
            
            
            if animal.images.first!.contains(".jpg"){
                Image(String(animal.images.first!.dropLast(4)))
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15).stroke(.secondary, lineWidth: 4)
                    }
                    .shadow(radius: 7)

            }else{
                Image(String(animal.images.first!.dropLast(5)))
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        RoundedRectangle(cornerRadius: 15).stroke(.secondary, lineWidth: 4)
                    }
                    .shadow(radius: 7)
            }
            
            
            
            Text(animal.name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            
            Spacer()
            
            
            if animal.checked{
                Text("✅")
                    .padding()
            }else{
                Text("❌")
                    .padding()
            }
            
        }
    }
}

struct RowComponent_Previews: PreviewProvider {
    static var previews: some View {
        RowComponent(animal: Animals.mocked.animals.first!)
    }
}

