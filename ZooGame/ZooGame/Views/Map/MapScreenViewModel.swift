//
//  MapScreenViewModel.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import Foundation
import MapKit

@MainActor
class MapScreenViewModel: ObservableObject {
    struct RestrictedArea{
        var leftLong: Double
        var rightLong: Double
        var topLat: Double
        var botLat: Double
        
        //left:49,23166° S, 16,53440° V
        //rigth: 49,23164° S, 16,53492° V
        
        //top: 49,23196° S, 16,53468° V
        //bot: 49,23153° S, 16,53471° V
    }
    
    
    var restrictArea = RestrictedArea(leftLong: 16.53440, rightLong: 16.53492, topLat: 49.23196, botLat: 49.23153)
    
    func checkIfInBoundingBox(userLat: Double, userLong: Double, animalLat: Double, animalLong: Double) -> Bool{
        let constant = 0.0002
        var result = false
        if((animalLat - constant) <= userLat &&  userLat <= (animalLat + constant)){
            if((animalLong - constant) <= userLong &&  userLong <= (animalLong + constant)){
                result = true
            }
        }
        return result
    }
    
    func isUserInRestrictedArea(lat:Double, long:Double) -> Bool{
        let containsLong = (restrictArea.leftLong...restrictArea.rightLong).contains(long)
        let containsLat = (restrictArea.botLat...restrictArea.topLat).contains(lat)
        
        return (containsLat && containsLong)
        
    }
    
    func check(){
        print("wow")
    }
    
    
        
    
}
