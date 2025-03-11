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
    let title: String = "Leader Board"

    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .overlay(
                VStack {
                    Text("LEADERBOARD")
                    
                } // VSTACK
                    .padding()
            ) // OVERLAY
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
        } // BODY -> VIEW
    } // CONTENT VIEW
}

#Preview {
    ContentView()
}
