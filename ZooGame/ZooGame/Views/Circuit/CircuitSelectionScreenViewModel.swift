//
//  CircuitSelectionScreenViewModel.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import Foundation


@MainActor class CircuitSelectionScreenViewModel: ObservableObject {
    @Published var animals = Animals.mocked
    
    @Published var loading = false
    
    var apiManager: ApiProtocol = ApiManager()
    
//    init() {
//        let uiTesting = ProcessInfo.processInfo.arguments.contains("Testing")
//        if (uiTesting) {
//            self.apiManager = MockApiManager()
//            print("✅ testing")
//        }
//    }
    
    func fetchData() async {
        loading = true
        do {
            animals = try await apiManager.fetchData()
            loading = false
        } catch {
            print("❌ error: \(error)")
        }
    }
}
