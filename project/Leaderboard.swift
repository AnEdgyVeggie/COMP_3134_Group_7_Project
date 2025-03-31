//
//  ContentView.swift
//  project
//
//  Created by Taylor Martin on 2025-02-26.
//  Contributors:
//  Ethan Sylvester: 101479568
//  Taylor Martin: 100849882
//  Amanda Gurney: 101443253

import SwiftUI
import CoreData


struct LeaderboardView: View {
    let title: String = "Leaderboard"
    
    private var players: [GamePlayer] = [  ]
    
    
    init() {
        players = fetchData()
    }

    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .overlay(
                VStack {
                    
                    Text(title)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.vertical, 10)
                        
                    ScrollView {
                        Grid {
                            GridRow {
                                Image("medal_gold")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                Text(players[0].username.capitalized)
                                    .font(.system(size: 24))
                                Text("\(players[0].score)")
                                    .font(.system(size: 24))
                            }
                                .frame(height: 52)
                            
                            GridRow {
                                Image("medal_silver")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                Text(players[1].username.capitalized)
                                    .font(.system(size: 24))
                                Text("\(players[1].score)")
                                    .font(.system(size: 24))
                            }
                                .frame(height: 52) 
                            
                            GridRow {
                                Image("medal_bronze")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                Text(players[2].username.capitalized)
                                    .font(.system(size: 24))
                                Text("\(players[2].score)")
                                    .font(.system(size: 24))
                            }
                                .frame(height: 52)

                            ForEach(Array(seperateTopPlayers().enumerated()), id: \.offset) { index, player in
                                
                            
                                GridRow{
                                    Text(String(index+4))
                                        .font(.system(size: 24))
                                    Text(player.username.capitalized)
                                        .font(.system(size: 24))
                                    Text("\(player.score)")
                                        .font(.system(size: 24))
                                }
                                .frame(height: 52)
                            }
                        }
                        .padding(.vertical, 20)
                        
                    }
                    .frame(width: 332, height: 500, alignment: .center)
                        .border(Color.black, width: 2)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 10)
                        .font(.system(size: 32, weight: .bold))
                        .shadow(radius: 10)
                        
                    NavigationLink(destination: {
                        ContentView()

                    }, label: {
                        Text("MAIN MENU")
                            .font(.system(size: 42, weight: .heavy))
                            .frame(width: 250)

                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        Image("sword")

                            .frame(width: 60)
                    } // BUTTON -> LABEL
                    )
                        .fixedSize().frame(width: 332, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.75, green: 0.75, blue: 0.75))
                    
                        .padding(.top, 10)
                    
                } // VSTACK
                    .padding()
            ) // OVERLAY
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
        } // BODY -> VIEW
    } // CONTENT VIEW
    
    
    func seperateTopPlayers() -> [ GamePlayer ] {
        var badPlayers: [GamePlayer] = []
        for i in stride(from: 3, to: players.count, by: 1) {

            badPlayers.append(players[i])
        }
        return badPlayers
    }
    
    func setPersistentContainer() -> NSPersistentContainer {
        return {
            let container = NSPersistentContainer(name: "UserData")
            container.loadPersistentStores(completionHandler: { (description, error) in
                if let error = error as NSError? {
                    print("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    }

    func fetchData() -> [ GamePlayer ] {
        var players : [GamePlayer] = []
        let persistentContainer = setPersistentContainer()
        
        let context = persistentContainer.viewContext
        let fetchReq = NSFetchRequest<GamePlayer>(entityName: "GamePlayer")
        
        do {
            let results = try context.fetch(fetchReq)
            
            for result in results {
                players.append(result)
            }
            
        } catch {
            print("could not retrieve players")
        }
        players.sort(by:  {$0.score.compare($1.score) == .orderedDescending} )
        return players
    }
    
}





#Preview {
    LeaderboardView()
}
