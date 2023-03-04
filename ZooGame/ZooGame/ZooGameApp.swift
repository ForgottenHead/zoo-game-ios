//
//  ZooGameApp.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 06/01/2023.
//

import SwiftUI
import ConcentricOnboarding

@main
@MainActor
struct ZooGameApp: App {
    
    @State var changescreen: Bool = false
    var body: some Scene {
        
        WindowGroup {
            
            if (changescreen ||  UserDefaults.standard.bool(forKey: "wasPresented")){
                CircuitSelectionScreen()
            }else{
                
                ConcentricOnboardingView(pageContents: MockData.pages.map { (PageView(page: $0), $0.color) })
                                .insteadOfCyclingToFirstPage {
                                    changescreen.toggle()
                                    UserDefaults.standard.set(true, forKey: "wasPresented")
                                }
                                .duration(1.0)
                                .nextIcon("chevron.forward")
            }
            
        }
    }
}
