//
//  QuizScreenView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 13/01/2023.
//

import SwiftUI

struct QuizInitailView: View {

    @StateObject var quizManager: QuizManager
    
    
    var body: some View {
        
        if quizManager.animalsSet.isEmpty{
            VStack(spacing:40){
                VStack(spacing:20){
                    Text("Koniec")
                        .accentColorTitle()
                    
                    Text("Kedze si nevykonal Check-in pre ziadne zviera, nie je mozne vytvorit quiz! 😢")
                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    
                }.padding()
                
                NavigationLink{
                    CircuitSelectionScreen()
                }label: {
                    PrimaryButton(text: "Zacat znova")
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "C9FDDC"))
                .edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
            
        }else{
            
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("Quiz")
                        .accentColorTitle()
                    
                    Text("Si pripraveny na quiz?")
                        .foregroundColor(.primary)

                    
                }
                
                NavigationLink{
                    QuizScreenView()
                        .environmentObject(quizManager)
                }label: {
                    PrimaryButton(text: "Sputit Quiz")
                }
                
            }
            .onAppear(perform: {
                quizManager.setupManager()
            })
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "C9FDDC"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
        
        

    }
}

struct QuizInitailView_Previews: PreviewProvider {
    static var previews: some View {
        QuizInitailView(quizManager: QuizManager())
            
    }
}
