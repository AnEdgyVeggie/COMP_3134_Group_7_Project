//
//  ContentView.swift
//  project
//
//  Created by Ethan Sylvester on 2025-03-11.
//  Contributors:
//  Ethan Sylvester: 101479568
//  Taylor Martin: 100849882
//  Amanda Gurney: 101443253

import SwiftUI
import CoreData


struct WinScreenView: View {
    let title: String = "Winner!"

    var playerName: String = ""
    let userPoints: Int
    
    
    init(playerName: String? = "Player Name", userPoints: Int = 0) {
        self.playerName = playerName!
        self.userPoints = userPoints
        
        saveData()
    }
    
    
    
    var body: some View {
        NavigationView {

            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .navigationBarHidden(true)
            .overlay(
                VStack {
                    Text(title)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    
                    Text(playerName)
                        .fixedSize()
                        .frame(width: 332, height: 64, alignment: .center)
                        .border(Color.black, width: 2)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 60)
                        .font(.system(size: 32, weight: .bold))
                    
                    ZStack {
                        Image("default_profile")
                    }
                    .overlay(
                        Image("crown")
                            .resizable()
                            .frame(width: 230, height: 200)
                            .offset(x: 0, y: -80)
                    )
                    
                    HStack {
                        Image("coin")
                            .resizable()
                            .frame(width: 96, height: 96)
                        Text("\(String(userPoints)) Points")
                    }
                        .fixedSize()
                        .frame(width: 332, height: 88, alignment: .center)
                        .border(Color.black, width: 2)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 20)
                        .font(.system(size: 32, weight: .bold))
                
                    NavigationLink(destination: {
                        LevelOne(playerName: playerName)
                        

                    }, label: {
                        Text("PLAY AGAIN")
                            .font(.system(size: 42, weight: .heavy))

                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                        Image("sword")
                            .resizable()
                            .frame(width: 64, height: 64)
                    } // BUTTON -> LABEL
                                   
                )
                    .fixedSize().frame(width: 352, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.bottom, 30)
                    
                    
                    NavigationLink(destination: {
                        ContentView()
                        

                    }, label: {
                        Image("map")
                            .resizable()
                            .frame(width: 64, height: 64)
                        Text("MAIN MENU")
                            .font(.system(size: 42, weight: .heavy))
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))

                    } // BUTTON -> LABEL
                                   
                )
                    .fixedSize().frame(width: 352, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 30)
                    
                } // VSTACK
                    .padding()
            ) // OVERLAY
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
        } // BODY -> VIEW

    } // CONTENT VIEW
    

    func setPersistentContainer() -> NSPersistentContainer {
        return {
            let container = NSPersistentContainer(name: "PlayerData")
            container.loadPersistentStores(completionHandler: { (description, error) in
                if let error = error as NSError? {
                    print("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    }

    

    func saveData() {
        let persistentContainer: NSPersistentContainer = setPersistentContainer()
        
        let context = persistentContainer.viewContext
        
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "GamePlayer", in: context) else {
            print("ERROR IN RETRIEVING ENTITY DESCRIPTION IN WIN SCREEN")
            return
        }
        
        let newPlayer = NSManagedObject(entity: entityDescription, insertInto: context)
        newPlayer.setValue(playerName, forKey: "username")
        newPlayer.setValue(userPoints, forKey: "score")
        
        do {
            try context.save()
            print("Saved user in win screen")
        } catch {
            print("ERROR SAVING USER IN WIN SCREEN")
        }
        
        
    }
    
    
    
}

#Preview {
    WinScreenView()
}
