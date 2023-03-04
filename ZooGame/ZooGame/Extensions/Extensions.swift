//
//  Extensions.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import Foundation
import SwiftUI

extension Text {
    func accentColorTitle() -> some View {
        self .font(.system(size: 40, weight: .bold, design: .rounded))
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
