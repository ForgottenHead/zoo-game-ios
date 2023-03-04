//
//  CheckInAnimalAlertView.swift
//  ZooGame
//
//  Created by Nikolas Šťastný on 09/01/2023.
//

import SwiftUI
import AlertToast

struct CustomBlurView: UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct CheckInAnimalAlertView: View {
    @Binding var show: Bool
    var animalName: String
    var animalImage: String
    var checkInAction: () -> Void
    var cancelAction: () -> Void
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            
            VStack(alignment: .center, spacing: 5){
                Text(animalName)
                    .font(.headline)
                    .fontWeight(.heavy)
                

                HStack(alignment: .center){
                    
                    if animalImage.contains(".jpg"){
                        Image(String(animalImage.dropLast(4)))
                           .resizable()
                           .frame(width: 100, height: 100)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                           .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(.black, lineWidth: 1)
                       )
                    }else{
                        Image(String(animalImage.dropLast(5)))
                           .resizable()
                           .frame(width: 100, height: 100)
                           .clipShape(RoundedRectangle(cornerRadius: 10))
                           .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(.black, lineWidth: 1)
                       )
                    }
                    
                  
                        
                Text("Chcete vykonat check-in?")
                    
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .padding(.leading)
                    

                    
                }
                
                
                Button(action: checkInAction, label: {
                    Text("Check in")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.green)
                        .clipShape(Capsule())
                })
                
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            
           
            //.background(Color(red: 211/255, green: 251/255, blue: 70/255))
            .background(CustomBlurView())
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(.secondary, lineWidth: 3))
            
            
            Button(action: cancelAction){
                Image(systemName: "xmark.circle")
                    .font(.system(size: 32))
                    .foregroundColor(.secondary)
            }.padding()
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct CheckInAnimalAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInAnimalAlertView(show: .constant(true), animalName: "Surikata", animalImage: "surikata.jpg", checkInAction: {}, cancelAction: {})
    }
}
