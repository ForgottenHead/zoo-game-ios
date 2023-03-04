//
//  AnimalListView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import SwiftUI

struct AnimalListView: View {
    var animalList: [Animal]
    var colors = [Color(hex: "C9FDDC"), Color(hex: "D2F9CD")]
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView{
            
            List(animalList){ item in
                       
                NavigationLink{
                    DetailScreenListView(animal: item)
                } label: {
                    RowComponent(animal: item)
                       
                        .padding(.vertical, 4)
    
                }
               // .listRowBackground(Color(hex: "C9FDDC"))
                .listRowSeparatorTint(.secondary)

            }
            
            ///Background color change
            .scrollContentBackground(.hidden)
            //.toolbarBackground(Color(red: 236/255, green: 244/255, blue: 207/255))
            //.toolbarBackground(Color(hex: "C9FDDC"))
            .background(.secondary.opacity(0.2))
            
            .navigationTitle("Zoznam zvierat")
            .foregroundColor(.primary)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .cancellationAction){
                        Button(action:{
                            isPresented = false
                        },label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.primary)
                        })
                        
                    }
                }
            

        }.accentColor(.green)
       
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalListView(animalList: [Animals.mocked.animals.first!, Animals.mocked.animals.first!, Animals.mocked.animals.first!], isPresented: .constant(true))
    }
}
