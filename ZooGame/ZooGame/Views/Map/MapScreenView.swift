//
//  MapScreenView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 07/01/2023.
//

import SwiftUI
import MapKit
import CodeScanner
import SlideOverCard


struct MapScreenView: View {
    @State var animals: [Animal]
    
    @State var isListPresented = false
    @State var isDetailPresented: Animal? = nil
    @State var isUserInRestrictedArea = false
    
    @State var showAlert = true
    
    @State var idToBeChanged: [UInt] = []
    @State var showCheckInAlert: Bool = false
    
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?
    
    @State private var lastCheckedAnimal: Animal? = nil
    @State private var isLastCheckCardPresented = false
    
    @State private var isEndAlertPresented: Bool = false
    
    
    @ObservedObject var viewmodel = MapScreenViewModel()
    @StateObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 49.23109, longitude: 16.53312),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    
    var body: some View {
            ZStack(alignment: .bottomTrailing){
                
                Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.follow) ,
                    annotationItems: animals,
                    annotationContent: { animal in
                    
                    
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: animal.lat, longitude: animal.long), content: {
                        
                        Image(systemName: "pawprint.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.green)
                            .tint(.white)
                            .frame(width: 25, height: 25)
                            .font(.headline)
                            .onTapGesture {
                                isDetailPresented = animal
                            }
                    })
                    
                }
                ).onAppear{
                    MKMapView.appearance().mapType = .standard
                }
                .ignoresSafeArea()
                
                
                ///Show alert when animal is nearby to check in
                if(!idToBeChanged.isEmpty){
                    let currentAnimal = self.animals.filter( { $0.id == idToBeChanged.first } ).first!
                    
                    
                    ///Custiom Alert to check-in/ cancel nearby animal
                    CheckInAnimalAlertView(
                        show: $showCheckInAlert,
                        animalName: currentAnimal.name,
                        animalImage: currentAnimal.images.first!,
                        checkInAction: {
                            let index = self.animals.firstIndex(where: { $0.id == idToBeChanged.first})
                            self.animals[index!].checked = true
                            let _ = idToBeChanged.popLast()
                            showCheckInAlert.toggle()
                            self.lastCheckedAnimal = self.animals[index!]
                            self.isLastCheckCardPresented = true
                        },
                        cancelAction: {
                            let _ = idToBeChanged.popLast()
                            showCheckInAlert.toggle()
                            
                        })
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                            let _ = idToBeChanged.popLast()
                            showCheckInAlert.toggle()
                            })
                    }
                    
                    
                }
                
                
                ///Show alert if user is/or enters a restricted area and enable QR scanning
                if isUserInRestrictedArea {
                    Button(action: {
                        isPresentingScanner = true
                    }, label: {
                        HStack{
                            Image(systemName: "qrcode.viewfinder")
                                .foregroundColor(.white)
                            Text("Scan QR")
                                .foregroundColor(.white)
                        }
                    })
                    .padding(5)
                    .background(.green)
                    .clipShape(Capsule())
                    .padding(10)
                    
                    
                    
                    if showAlert{
                        insideView
                    }
                }
                
            }
            
        .onChange(of: locationManager.location){ location in
            checkInAnimalWhenNearby()
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .secondaryAction) {
                
                NavigationLink{
                    QuizInitailView(quizManager: QuizManager(animalSet: animals.filter{ $0.checked == true }) )
                }label: {
                    HStack{
                        Image(systemName: "xmark")
                        Text("Ukoncit hru")
                            .foregroundColor(.red)
                           
                        
                    }
                }
            }
            
            ToolbarItem(placement: .primaryAction){
                Button(action: {
                    isListPresented.toggle()
                }, label: {
                    HStack(alignment: .center){
                        Image(systemName: "list.dash")
                            .foregroundColor(.white)
                        Text("Zoznam")
                            .foregroundColor(.white)
                            .padding(5)
                    }
                })
                .padding(.horizontal, 5)
                .background(.green)
                .clipShape(Capsule())

            }
        }
        
        
        .slideOverCard(isPresented: $isLastCheckCardPresented
                       , options: [.hideDismissButton], style: SOCStyle(
                        corners: 24.0,
                        continuous: false,
                        innerPadding: 16.0, outerPadding: 20.0,
                        style: .clear )
        ){
            PopupTopView(animalName: lastCheckedAnimal?.name ?? "")
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        isLastCheckCardPresented = false
                        lastCheckedAnimal = nil})
                }
        }
        
        .sheet(isPresented: $isListPresented){
            AnimalListView(animalList: animals, isPresented: $isListPresented)
        }
        
        .sheet(item: $isDetailPresented, onDismiss: nil){ location in
            DetailScreenView(animal: location, isPresented: $isDetailPresented)
                .ignoresSafeArea()
        }
        
        .slideOverCard(isPresented: $isPresentingScanner){
            qrScanView
        }
        
        
    

            
    }
}

//MARK: Extension
extension MapScreenView{
    //MARK: Function Check-in animal when nearby
    func checkInAnimalWhenNearby(){
        if !viewmodel.isUserInRestrictedArea(lat: locationManager.latitude, long: locationManager.longitude){
            showAlert = true
            isUserInRestrictedArea = false
            
            for item in self.animals{
                if viewmodel.checkIfInBoundingBox(userLat: locationManager.latitude, userLong: locationManager.longitude, animalLat: item.lat, animalLong: item.long)  && !item.checked {
                    
                    if(!idToBeChanged.contains(item.id)){
                        idToBeChanged.append(item.id)
                        showCheckInAlert = true
                    }
                    
                    print("AlertLog :  \(idToBeChanged)")
                }
            }
                    
            
        }else{
            isUserInRestrictedArea = true
        }
    }
        
    //MARK: QRSCANVIEW
    var qrScanView: some View{
        
        VStack{
            
            Text("Naskenujte QR kod").font(.headline).fontWeight(.heavy)
            
            Text("Naskenujte QR kod, ktory je umiestneny na informacnej tabuli zvierata.").font(.footnote).padding(.bottom)
            
            CodeScannerView(codeTypes: [.qr]) { response in
                        if case let .success(result) = response {
                            scannedCode = result.string

                            if !(scannedCode ?? "").isEmpty{

                                ///TO BE CHANGED
                                let index = self.animals.firstIndex(where: { $0.id == UInt(scannedCode!)})
                                self.animals[index!].checked = true
                                self.lastCheckedAnimal = self.animals[index!]
                                self.isLastCheckCardPresented = true
                            }

                            scannedCode = nil


                            isPresentingScanner = false
                        }
                    }.frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        
        
    }
    
    //MARK: InsideView
    private var insideView: some View{
        Text("")
 
        .alert("⚠️ Varovanie ⚠️", isPresented: $isUserInRestrictedArea){
            Button(role:.cancel){
                showAlert = false
            } label:{
                Text("OK")
            }
        } message: {
            Text("Vstupili ste dnu, checkin iba cez scen QR kodu")
        }
        
    }

}



struct MapScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MapScreenView(animals: Animals.mocked.animals)
    }
}




