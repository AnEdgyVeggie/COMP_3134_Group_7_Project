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

struct ContentView: View {
    let title: String = "Language Knight"
    @State private var usernamePlaceholder: String = "Player Name"
    @State private var userImage: Image? = nil
    @State private var usernameField: String = "Player Name"
     
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK

            .overlay(
                VStack {
                    Text(title)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.vertical, 40)
                        
                    if (userImage != nil) {
                        userImage.fixedSize().frame(width: 300, height: 300)
                            .padding(.bottom, 40)
                    } else {
                        Image("default_profile").fixedSize().frame(width: 200, height: 200)
                            .padding(.bottom, 20)
                    }

                    HStack {
                        TextField(usernamePlaceholder, text: $usernameField)
                            .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                            .font(.title)
                            .frame(width: 240, height: 65, alignment: .center)
                            .padding(.leading)
                            
                        Image("feather")
                            .background(Color(red: 0.55, green: 0.45, blue: 0.15))
                        
                    } // HSTACK
                        .fixedSize().frame(width: 332, height: 64, alignment: .center)
                        .border(Color.black, width: 2)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 40)
                    
                    NavigationLink(destination: {
                        LevelOne(playerName: usernameField)

                    }, label: {
                        Text("PLAY")
                            .font(.system(size: 42, weight: .heavy))
                            .frame(width: 150)
                            .padding()
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                        Image("sword")
                            .padding()
                            .frame(width: 100)
                    } // BUTTON -> LABEL
                )
                        .fixedSize().frame(width: 332, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.bottom, 30)
                    
                    HStack {
                        NavigationLink(destination: {
                            SettingsView()
                        }, label: {
                            Image("setting")
                                .resizable().frame(width: 80, height: 80)
                        })
                        NavigationLink(destination: {
                            LeaderboardView()
                        }, label: {
                            Image("scroll")
                                .resizable().frame(width: 80, height: 80)
                                .padding(.leading, 100)
                        })

                    } // VSTACK
                    .fixedSize().frame(width: 200, height: 80)
                    
                } // VSTACK
                .padding()
                
                
            ) // OVERLAY
        .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
        } // NAVIGATION STACK
        .navigationBarHidden(true)
    } // BODY -> VIEW

} // CONTENT VIEW

#Preview {
    ContentView()
}
