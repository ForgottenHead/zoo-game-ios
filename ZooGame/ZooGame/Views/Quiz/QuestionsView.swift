//
//  QuestionsView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import SwiftUI

struct QuestionsView: View {
    @EnvironmentObject var quizManager: QuizManager
    
    var body: some View {
        VStack(spacing: 40){
            HStack{
                Text("Quiz")
                    .accentColorTitle()
                
                Spacer()
                
                Text("\(quizManager.index + 1 ) z \(quizManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: quizManager.progress)

            
            VStack(alignment: .leading, spacing: 20){
                Text("Ako sa vola zviera na obrazku?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.secondary)
                
                
                if(!quizManager.animalsSet.isEmpty){
                    Image(String(quizManager.animalsSet[quizManager.index].images.randomElement()?.dropLast(4) ?? "nic"))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                            .frame(maxWidth: .infinity, maxHeight:.infinity, alignment: .center)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                }
                
                    
                ForEach(quizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager)
                }
               
            }
            
            Button{
                quizManager.goToNextQestion()
            }label: {
                PrimaryButton(text: "Dalej", background: quizManager.answerSelected ? Color("AccentColor") : .secondary)
                    .disabled(!quizManager.answerSelected)
            }
           
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarBackButtonHidden(true)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
        .environmentObject(QuizManager())
    }
}
