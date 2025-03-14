//
//  ContentView.swift
//  project
//
//  Created by Ethan Sylvester on 2025-02-12.
//  Contributors:
//  Ethan Sylvester: 101479568
//  Taylor Martin: 100849882
//  Amanda Gurney: 101443253

import SwiftUI

struct LeaderboardView: View {
    let title: String = "Leaderboard"
    
    private var players: [Player] = [
        Player(playerName: "player 4", score: 2000),
        Player(playerName: "player 5", score: 1800),
        Player(playerName: "player 2", score: 1700),
        Player(playerName: "player 3", score: 1500),
        Player(playerName: "player 1", score: 1260),
        Player(playerName: "player 6", score: 1100),
        Player(playerName: "player 15", score: 1050),
        Player(playerName: "player 12", score: 1000),
        Player(playerName: "player 13", score: 950),
        Player(playerName: "player 11", score: 900),
        Player(playerName: "player 16", score: 800),
    ]
    
//    private var seperatePlayers: [Player]
    
//    init() {
//        self.seperatePlayers = seperateTopPlayers()
//    }

    
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
                                Text(players[0].playerName.capitalized)
                                    .font(.system(size: 24))
                                Text(String(players[0].score))
                                    .font(.system(size: 24))
                            }
                                .frame(height: 52)
                            
                            GridRow {
                                Image("medal_silver")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                Text(players[1].playerName.capitalized)
                                    .font(.system(size: 24))
                                Text(String(players[1].score))
                                    .font(.system(size: 24))
                            }
                                .frame(height: 52)
                            
                            GridRow {
                                Image("medal_bronze")
                                    .resizable()
                                    .frame(width: 48, height: 48, alignment: .center)
                                Text(players[2].playerName.capitalized)
                                    .font(.system(size: 24))
                                Text(String(players[2].score))
                                    .font(.system(size: 24))
                            }
                            .frame(width: 100 ,height: 52)
                             
                            


                            ForEach(Array(seperateTopPlayers().enumerated()), id: \.offset) { index, player in

                                GridRow{
                                    Text(String(index+4))
                                        .font(.system(size: 24))
                                    Text(player.playerName.capitalized)
                                        .font(.system(size: 24))
                                    Text(String(player.score))
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
//                            .padding()
                            .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.3))
                        Image("sword")
//                            .padding()
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
    
    
    func seperateTopPlayers() -> [ Player ] {
        var badPlayers: [Player] = []
        for i in stride(from: 3, to: players.count, by: 1) {
            print(players[i].playerName)
            badPlayers.append(players[i])
        }
        return badPlayers
    }
    
    
    
}

#Preview {
    LeaderboardView()
}

struct Player: Identifiable {
    let playerName: String
    let score : Int
    var id: String { playerName }
}
