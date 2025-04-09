//
//  ContentView.swift
//  project
//
//  Created by Taylor Martin on 2025-02-19.
//  Contributors:
//  Ethan Sylvester: 101479568
//  Taylor Martin: 100849882
//  Amanda Gurney: 101443253

import SwiftUI

struct SplashScreen: View {
    
    let title = "Language Knight"

    var body: some View {
        ZStack {
            Color(red: 0.48, green: 0.28, blue: 0.26)
        }.overlay(
            VStack {
                Text(title)
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    .padding(.vertical, 40)
                HStack {
                    Image("skull")
                        .resizable()
                        .frame(width: 96, height: 96)
                    Image("sword_crossed")
                        .resizable()
                        .frame(width: 128, height: 128)
                    Image("skull")
                        .resizable()
                        .frame(width: 96, height: 96)
                }
                Text("Developed By")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    .padding(.top, 40)
                
                Text("Taylor Martin")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    .padding(5)
                Text("Amanda Gurney")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    .padding(5)
                Text("Ethan Sylvester")
                    .font(.system(size: 24, weight: .heavy))
                    .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    .padding(5)
                
                
            }

        )
        .background(Color(red: 0.48, green: 0.28, blue: 0.26))
    } // CONTENT VIEW
}

#Preview {
    SplashScreen()
}
