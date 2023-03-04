//
//  DetailScreenView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 08/01/2023.
//

import SwiftUI

struct DetailScreenView: View {
    var animal: Animal
    @Binding var isPresented: Animal?
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                
                if animal.name == "Lachtan medvědí"{
                    DetailHeaderView(image: String(animal.images.first!.dropLast(5))).ignoresSafeArea()
                }else{
                    DetailHeaderView(image: String(animal.images.first!.dropLast(4))).ignoresSafeArea()
                }
                
                
                VStack(alignment: .leading, spacing: 10){
                    
                    //Title
                    Text(animal.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    Text("Zakladne informacie")
                    //.font(.subheadline)
                        .fontWeight(.bold)
                    
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Group{
                            
                            Text("Latinske meno: \(animal.latinName)")
                            Text("Kontinent: \(animal.continent)")
                            Text("Trieda: \(animal.animalClass)")
                            Text("Rad: \(animal.order)")
                            Text("Druh: \(animal.family)")
                            
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding()
                        .background(.secondary.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    
                    Text("Dalsie informacie")
                    //.font(.subheadline)
                        .fontWeight(.bold)
                    
                    Divider()
                    
                    VStack(alignment: .leading){
                        Group{
                                                
                            Text("Velkost: \(animal.length)")
                            Text("Vaha: \(animal.weight)")
                            Text("Vyskyt: \(animal.geoRange)")
                            Text("Potrava: \(animal.diet)")
                            Text("Dlzka zivota: \(animal.lifespan)")
                            Text("IUCN: \(animal.iucnStatus)")
                            
                        }
                    }
                   
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                    .background(.secondary.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                }
                .padding(20)
                
                
                
            }.toolbarBackground(.hidden)
                .background(Color(hex: "C9FDDC"))
            //.background(BackgroundView())
            .navigationBarTitleDisplayMode(.inline)
                
                .toolbar{
                    ToolbarItem(placement:.cancellationAction){
                        Button(action: {
                            isPresented = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.primary)
                        })
                        
                    }
                }
            
            
        }
            
            

        
      
        
        
    

    }
   
}

struct DetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenView(animal: Animals.mocked.animals.first!, isPresented: .constant(Animals.mocked.animals.first!))
    }
}


