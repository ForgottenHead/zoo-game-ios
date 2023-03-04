//
//  Answer.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: String
    var isCorrect: Bool
}
