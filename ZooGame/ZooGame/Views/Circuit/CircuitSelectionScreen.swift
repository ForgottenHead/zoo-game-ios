//
//  CircuitSelectionScreen.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 06/01/2023.
//

import SwiftUI

struct CircuitSelectionScreen: View {
    @StateObject var viewModel = CircuitSelectionScreenViewModel()
    var apiManager: ApiProtocol = ApiManager()
    
    var body: some View {
        
        NavigationView{
//            List{
//                ForEach(viewModel.animals.animals){
//                    item in
//                    RowComponent(animal: item)
//                }
//            }
            ZStack{
                //BackgroundView()
                BackgroundView2()
                
                if viewModel.loading{
                    ProgressView("Nacitavam okruhy.")
                }else{
                    VStack{
                        Text("Vyber okruhu: ")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)

                        CircuitButton(value: "Maly okruh", viewModel: viewModel)
                        CircuitButton(value: "Stredny okruh", viewModel: viewModel)
                        CircuitButton(value: "Velky okruh", viewModel: viewModel)
                    }
                }
            }
            
            //.navigationTitle("Circuit selection")
            
        }.navigationBarBackButtonHidden(true)
        .accentColor(.green)
        
        .task {
            await viewModel.fetchData()
        }
    }
}


struct CircuitButton: View {
    var value: String
    var viewModel: CircuitSelectionScreenViewModel

    var body: some View{
        NavigationLink{
            switch(value){
            case "Maly okruh":
                MapScreenView(animals: viewModel.animals.animals.dropLast(9))
            case "Stredny okruh":
                MapScreenView(animals: viewModel.animals.animals.dropLast(5))
            default:
                MapScreenView(animals: viewModel.animals.animals)
            }
            
            
         
        } label: {
            PrimaryButton(text: value)
            
        }
        .foregroundColor(.white)
        .shadow(radius: 3)
        .padding(.bottom)
    
    }
}

struct BackgroundView2: View{
    var colors = [Color(hex: "C9FDDC"), Color(hex: "D2F9CD")]
    
    var body: some View {
        LinearGradient(
            gradient:
                Gradient(
                    colors:
                        colors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct BackgroundView: View {
    var colors = [Color(red: 236/255, green: 244/255, blue: 207/255),
                  Color(red: 211/255, green: 251/255, blue: 70/255),
                  Color(red: 248/255, green: 251/255, blue: 238/255)
    ]
    var body: some View {
        LinearGradient(
            gradient:
                Gradient(
                    colors:
                        colors),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CircuitSelectionScreen_Previews: PreviewProvider {
    static var previews: some View {
        CircuitSelectionScreen()
    }
}
