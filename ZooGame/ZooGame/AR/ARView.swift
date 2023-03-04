//
//  ARScreen.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 15/01/2023.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    var model: String
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView()
       
        
        // Load the "Box" scene from the "Experience" Reality File
        
        switch(model){
        case "kangaroo_3d.glb":
            let boxAnchor = try! Experience.loadKangaroo()
            arView.scene.anchors.append(boxAnchor)
        case "red_panda_3d.glb":
            let boxAnchor = try! Experience.loadRedpanda()
            arView.scene.anchors.append(boxAnchor)
        case "meerkat_3d.glb":
            let boxAnchor = try! Experience.loadMeerkcat()
            arView.scene.anchors.append(boxAnchor)
        default:
            let boxAnchor = try! Experience.load_default()
            arView.scene.anchors.append(boxAnchor)
        
        }
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

struct ARScreenView: View {
    var model: String
    var body: some View {
        ARViewContainer(model: model).edgesIgnoringSafeArea(.all)
    }
}

struct ARScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ARScreenView(model: "model")
    }
}
