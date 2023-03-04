//
//  OnboardMock.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 14/01/2023.
//

import UIKit
import SwiftUI

struct PageData {
    let title: String
    let header: String
    let content: String
    let imageName: String
    let color: Color
    let textColor: Color
}

struct MockData {
    static let pages: [PageData] = [
        PageData(
            title: "ZooGame",
            header: "Vitajte v aplikacii ZooGame",
            content: "Zabavna interaktivna hra v zoo.",
            imageName: "firstpage",
            color: Color(hex: "F38181"),
            textColor: Color(hex: "FFFFFF")),
        PageData(
            title: "ZooGame",
            header: "Mapa",
            content: "Popri priechode zoo, mozte vykonavat check-in zvierat, ktore ste navstivili. Takisto si mozte zobrazit detail alebo zoznam zvierat.",
            imageName: "map",
            color: Color(hex: "FCE38A"),
            textColor: Color(hex: "4A4A4A")),
        PageData(
            title: "ZooGame",
            header: "Quiz",
            content: "Na konci priechodu, mozte hru ukoncit. Cim spustite quiz zo zvierat pre ktore ste urobili check-in.",
            imageName: "quiz",
            color: Color(hex: "95E1D3"),
            textColor: Color(hex: "4A4A4A")),
    ]
}

/// Color converter from hex string to SwiftUI's Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}
