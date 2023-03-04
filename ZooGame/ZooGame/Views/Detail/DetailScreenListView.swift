//
//  DetailScreenListView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 08/01/2023.
//

import SwiftUI

struct DetailScreenListView: View {
    var animal: Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            
            if animal.name == "Lachtan medvědí"{
                DetailHeaderView(image: String(animal.images.first!.dropLast(5))).ignoresSafeArea()
            }else{
                DetailHeaderView(image: String(animal.images.first!.dropLast(4))).ignoresSafeArea()
            }
    

            VStack(alignment: .leading, spacing: 20){
                
                ///Header
                
                

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
                    
                    NavigationLink{
                        ARScreenView(model: animal.model)
                    }label: {
                        PrimaryButton(text: "Zobrazit v AR")
                    }.padding(.top, 10)

                }
                .padding(20)
                
                
  
            }
    
        }
        .toolbarBackground(Color(red: 236/255, green: 244/255, blue: 207/255))
        //.background(BackgroundView())
        .background(Color(hex: "C9FDDC"))
        .navigationTitle(animal.name)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct DetailScreenListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreenListView(animal: Animals.mocked.animals.first!)
    }
}
