//
//  Animal.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import Foundation

struct Animals: Codable {
    var animals: [Animal]
    
    static var mocked: Animals = {
        return Animals(animals: [Animal(id: 1, name: "Name", latinName: "LatinName", continent: "continent", animalClass: "AnimalClass", order: "order", family: "family", length: "length", weight: "weight", geoRange: "geoRange", diet: "diet", lifespan: "lifespan", iucnStatus: "IUCN", lat: 49.23173, long: 16.534537, images: ["zirafa.jpg"], model: "model", checked: false, restricted: false)])
    }()
//
//    static var mocked: Animals = {
//            return Animals(animals: [Animal(id: 1, name: "Name", latinName: "LatinName", lat: 49.23173, long: 16.534537)])
//        }()
    
}

struct AnimalsNames{
    static var listOfNames:  [String] = { return
        ["Alpaka", "Bobr kanadský","Dracena guyanská","Hroznýšovec duhový","Jaguarundi","Klaun očkatý (Nemo)","Klokan parma","Lachtan medvědí","Medvěd lední", "Panda červená","Rys kanadský","Surikata","Tygr sumaterský"]
    }()
    
    
}

struct Animal: Codable, Identifiable {
    var id: UInt
    var name: String
    var latinName: String
    var continent: String
    var animalClass: String
    var order : String
    var family: String
    //var exposition: String
    
    var length: String
    var weight: String
    var geoRange: String
    var diet: String
    var lifespan: String
    var iucnStatus: String
    
    var lat: Double
    var long: Double
    var images: [String]
    var model: String
    var checked: Bool
    var restricted: Bool
}


