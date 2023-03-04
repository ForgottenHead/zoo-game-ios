//
//  QuizScreenView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import SwiftUI

struct QuizScreenView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        if quizManager.reachedEnd {
            VStack(spacing: 20){
                Text("Quiz")
                    .accentColorTitle()
                
                Text("Gratulujem, dokoncili ste ZooGame! 🥳")
                Text("Vase skore \(quizManager.score) z \(quizManager.length)")
                
                NavigationLink{
                    CircuitSelectionScreen()
                }label: {
                    PrimaryButton(text: "Hrat znova")
                }
                
                
                
            }
            .foregroundColor(Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "C9FDDC"))
                .navigationBarBackButtonHidden(true)
            
            
            
        }else{
            QuestionsView()
                     .environmentObject(quizManager)
                     .background(Color(hex: "C9FDDC"))
        }
        
     
        
        
            
    }
}

struct QuizScreenView_Previews: PreviewProvider {
    static var previews: some View {
        QuizScreenView()
            .environmentObject(QuizManager())
    }
}
