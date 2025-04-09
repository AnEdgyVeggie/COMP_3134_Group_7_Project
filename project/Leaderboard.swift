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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeToLoad = 10
    
    @State private var players: [GamePlayer] = []
    @State private var playerCount: Int = 0
    
    @State private var loaded = false
    
//    init() {

//    }

    
    var body: some View {
       	 NavigationView {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            }
            .onReceive(timer) { time in
                if (timeToLoad > 0) {
                    if (self.players.count  == 0) {
                        timeToLoad = timeToLoad - 1

                    }
                }

            }// ZSTACK
            .onAppear() {
                players = fetchData()
//                print(players)
            }
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
                                if (self.playerCount > 0) {
                                    Text(players[0].username.capitalized)
                                        .font(.system(size: 24))
                                    Text("\(players[0].score)")
                                        .font(.system(size: 24))
                                }
                                else if (timeToLoad > 0) {
                                    Text("Loading...")
                                } else {
                                    Text("No Player Data Found")
                                        .font(.system(size: 20))
                                }

                            }
                                .frame(height: 52)
                            
                            GridRow {
                                Image("medal_silver")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                if (playerCount > 1) {
                                    Text(players[0].username.capitalized)
                                        .font(.system(size: 24))
                                    Text("\(players[0].score)")
                                        .font(.system(size: 24))
                                }
                                else if (timeToLoad > 0) {
                                    Text("Loading...")
                                } else {
                                    Text("No Player Data Found")
                                        .font(.system(size: 20))
                                }
                            }
                                .frame(height: 52)
                            
                            GridRow {
                                Image("medal_bronze")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                if (players.count > 2) {
                                    Text(players[0].username.capitalized)
                                        .font(.system(size: 24))
                                    Text("\(players[0].score)")
                                        .font(.system(size: 24))
                                }
                                else if (timeToLoad > 0) {
                                    Text("Loading...")
                                } else {
                                    Text("No Player Data Found")
                                        .font(.system(size: 20))
                                }
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
            let container = NSPersistentContainer(name: "PlayerData")
            container.loadPersistentStores(completionHandler: { (description, error) in
                if let error = error as NSError? {
                    print("Unresolved error \(error)")
                }
            })
            return container
        }()
    }

    func fetchData() -> [ GamePlayer ] {
        var dbPlayers : [GamePlayer] = []
        let persistentContainer = setPersistentContainer()
        
        let context = persistentContainer.viewContext
        let fetchReq = NSFetchRequest<GamePlayer>(entityName: "GamePlayer")
        
        do {
            let results = try context.fetch(fetchReq)
//            print(results.count)

            for result in results {
                dbPlayers.append(result)
            }
            
        } catch {
            print("could not retrieve players")
        }
        dbPlayers.sort(by:  {$0.score.compare($1.score) == .orderedDescending} )
        print(dbPlayers.count)
        self.playerCount = dbPlayers.count
        print(playerCount)
        print(self.playerCount)
        return dbPlayers
    }
    
}



#Preview {
    LeaderboardView()
}
