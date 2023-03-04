//
//  QuizManager.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    var animalsSet: [Animal] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    
    init(){
        
    }
    
    convenience init(animalSet: [Animal]){
        self.init()
        self.animalsSet = animalSet.shuffled()
        self.length = animalSet.count
        
    }
    
    func setupManager(){
        if(!animalsSet.isEmpty){
            let currenAnimalToGuess = animalsSet[index]
                    let currentAnimalWrongSet = AnimalsNames.listOfNames.filter{ $0 != currenAnimalToGuess.name }.shuffled().prefix(3)
                    
                    var answersList: [Answer] = []
                    answersList.append(Answer(text: currenAnimalToGuess.name, isCorrect: true))
                    for wrongAnswer in currentAnimalWrongSet{
                        answersList.append(Answer(text: wrongAnswer, isCorrect: false))
                    }
                    
                    answerChoices = answersList.shuffled()

        }
    }
    
    func goToNextQestion(){
        if index + 1 < length {
            index += 1
            setQuestion()
            
        }else{
            reachedEnd = true
        }
    }
    
    func setQuestion(){
        self.answerSelected = false
        self.progress = CGFloat((Double(index + 1) / Double(length)) * 350)
        
        if index < length {
            setupManager()
        }
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    
    
    
}
