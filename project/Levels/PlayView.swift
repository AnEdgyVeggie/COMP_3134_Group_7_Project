//
//  ContentView.swift
//  project
//
//  Created by Amanda Gurney on 2025-02-28.
//  Contributors:
//  Ethan Sylvester: 101479568
//  Taylor Martin: 100849882
//  Amanda Gurney: 101443253


import SwiftUI

// Generate 3 random scrambled words for quick and easy access.
private let levelOne = scrambleWord(usedWords: [""])
private let levelTwo = scrambleWord(usedWords: [levelOne.0])
private let levelThree = scrambleWord(usedWords: [levelOne.0, levelTwo.0])

private var score = 0

struct LevelOne: View {
    
    @State private var scoreValue = 10
    @State private var scoreMultiplier = 105
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var path = NavigationPath()
    @State private var userGuess = "" // User's guess.
    @State private var successMsg: String? // Message sent when successful.
    @State var levelWon = false // Determine if user can move on to next level.
    
    @State private var toastVisible = false // makes toast not visible
    @State private var toastTimer: Timer? // timer for the toast
    
    var playerName: String = ""
    
    init(playerName: String? = "Player Name") {
        self.playerName = playerName!
        print("game started as \(playerName!)")
    }
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .navigationBarHidden(true)
            .onReceive(timer) { time in
                if (scoreMultiplier > 0) {
                    scoreMultiplier = scoreMultiplier - 1
                }
            }
            .overlay(
                VStack{
                    Text("Unscramble")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    //                        .padding(.vertical, 40)
                    HStack {
                        ForEach(Array(levelOne.1), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: 32, weight: .bold))
                        }
                        
                    } // HSTACK
                    .fixedSize()
                    .frame(width: 332, height: 64, alignment: .center)
                    .border(Color.black, width: 2)
                    .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                    .padding(.bottom, 20)
                    .font(.title)
                    
                    VStack {
                        
                        VStack {
                            
                            Spacer()
                            
                            HStack {
                                Image("default_profile")
                                    .resizable()
                                    .frame(width: 96, height: 96)
                                Image("sword_crossed")
                                Image("skull")
                                    .resizable()
                                    .frame(width: 96, height: 96)
                                    .shadow(radius: 10)
                            }
                            
                            Rectangle()
                                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.4))
                            //                                .fixedSize()
                                .frame(width: 330, height: 50)
                            
                            
                        }   .frame(width: 332, height: 186, alignment: .center)
                            .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                            .border(Color.black, width: 2)
                            .shadow(radius: 5)
                        
                        HStack {
                            TextField("GUESS", text: $userGuess)
                                .onSubmit {
                                    submitAnswer()
                                }
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
                        .padding(.vertical, 20)
                        
                        Button() {
                            submitAnswer()
                            
                        } label: {
                            Text("GUESS")
                                .font(.system(size: 42, weight: .heavy))
                                .frame(width: 150)
                                .padding()
                                .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                            Image("sword")
                                .padding()
                                .frame(width: 100)
                        } // BUTTON ->
                        .fixedSize().frame(width: 332, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.bottom, 10)
                        
                        Text(successMsg ?? "   ")
                            .font(.system(size: 24))
                            .foregroundColor(Color.white)
                        
                        if (levelWon) {
                            NavigationLink("PLAY LEVEL 2") {
                                LevelTwo(playerName: playerName)
                            }
                            .fixedSize().frame(width: 280, height: 58, alignment: .center)// NAVIGATION LINK
                            .font(.system(size: 32, weight: .bold))
                            .border(Color.black, width: 2)
                            .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                            
                            
                        } else {
                            Text("    ")
                                .fixedSize().frame(width: 332, height: 58, alignment: .center)
                        }
                    }
                } // VSTACK
            ) // OVERLAY
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
            
            //
            ToastView(isVisible: $toastVisible)
            
        } // NAVIGATION STACK

    } // VIEW
    
    func submitAnswer(){
        
        if (guessWord(guess: userGuess, answer: levelOne.0)) {
            successMsg = "You Win!"
            levelWon = true
            score = scoreValue * scoreMultiplier
        } else {
            if (scoreValue > 1) {
                scoreValue -= 1
            }
            // show toast to user if guess is incorrect
            toggleToast(isVisible: $toastVisible, toastTimer: &toastTimer)
        }
    }
}

struct LevelTwo: View {
    
    @State private var scoreValue = 10
    @State private var scoreMultiplier = 105
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var path = NavigationPath()
    @State private var userGuess = "" // User's guess.
    @State private var successMsg: String? // Message sent when successful.
    @State var levelWon = false // Determine if user can move on to next level.
    
    @State private var toastVisible = false // makes toast not visible
    @State private var toastTimer: Timer? // timer for the toast
    
    var playerName: String = ""
    
    init(playerName: String? = "Player Name") {
        self.playerName = playerName!
        print("game started as \(playerName!)")
    }
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .navigationBarHidden(true)
            .onReceive(timer) { time in
                if (scoreMultiplier > 0) {
                    scoreMultiplier = scoreMultiplier - 1
                }
            }
            .overlay(
                VStack{
                    Text("Unscramble")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                    //                        .padding(.vertical, 40)
                    HStack {
                        ForEach(Array(levelTwo.1), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: 32, weight: .bold))
                        }
                        
                    } // HSTACK
                    .fixedSize()
                    .frame(width: 332, height: 64, alignment: .center)
                    .border(Color.black, width: 2)
                    .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                    .padding(.bottom, 20)
                    .font(.title)
                    
                    VStack {
                        
                        VStack {
                            
                            Spacer()
                            
                            HStack {
                                Image("default_profile")
                                    .resizable()
                                    .frame(width: 128, height: 128)
                                Image("sword_crossed")
                                Image("skull")
                                    .resizable()
                                    .frame(width: 96, height: 96)
                                    .shadow(radius: 10)
                            }
                            
                            Rectangle()
                                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.4))
                                .frame(width: 330)
                            
                            
                        }   .frame(width: 332, height: 186, alignment: .center)
                            .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                            .border(Color.black, width: 2)
                            .shadow(radius: 5)
                        
                        HStack {
                            TextField("GUESS", text: $userGuess)
                                .onSubmit {
                                    submitAnswer()
                                }
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
                        .padding(.vertical, 20)
                        
                        Button() {
                            submitAnswer()
                            
                        } label: {
                            Text("GUESS")
                                .font(.system(size: 42, weight: .heavy))
                                .frame(width: 150)
                                .padding()
                                .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                            Image("sword")
                                .padding()
                                .frame(width: 100)
                        } // BUTTON ->
                        .fixedSize().frame(width: 332, height: 84, alignment: .center)
                        .border(Color.black, width: 3)
                        .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                        .padding(.bottom, 10)
                        
                        Text(successMsg ?? "   ")
                            .font(.system(size: 24))
                            .foregroundColor(Color.white)
                        
                        if (levelWon) {
                            NavigationLink("PLAY LEVEL 3") {
                                LevelThree(playerName: playerName)
                            }
                            .fixedSize().frame(width: 280, height: 58, alignment: .center)// NAVIGATION LINK
                            .font(.system(size: 32, weight: .bold))
                            .border(Color.black, width: 2)
                            .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                            .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                            
                            
                        } else {
                            Text("    ")
                                .fixedSize().frame(width: 332, height: 58, alignment: .center)
                        }
                    }
                } // VSTACK
            ) // OVERLAY
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
            
            // TOAST VIEW COMPONENT
            ToastView(isVisible: $toastVisible)
            
        } // NAVIGATION STACK
    } // VIEW
    func submitAnswer(){
        
        if (guessWord(guess: userGuess, answer: levelTwo.0)) {
            successMsg = "You Win!"
            levelWon = true
            score += scoreValue * scoreMultiplier
        } else {
            if (scoreValue > 1) {
                scoreValue -= 1
            }
            
            // show toast to user if guess is incorrect
            toggleToast(isVisible: $toastVisible, toastTimer: &toastTimer)
        }
    }
    
    
    struct LevelThree: View {
        
        @State
        private var scoreValue = 10
        
        @State
        private var scoreMultiplier = 105
        
        let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
        
        @State private var path = NavigationPath()
        @State private var userGuess = "" // User's guess.
        @State private var successMsg: String? // Message sent when successful.
        @State var levelWon = false // Determine if user can move on to next level.
        
        @State private var toastVisible = false // makes toast not visible
        @State private var toastTimer: Timer? // timer for the toast
        
        var playerName: String = ""
        
        init(playerName: String? = "Player Name") {
            self.playerName = playerName!
            print("game started as \(playerName!)")
        }
        
        var body: some View {
            
            NavigationStack(path: $path) {
                ZStack {
                    Color(red: 0.48, green: 0.28, blue: 0.26)
                } // ZSTACK
                .navigationBarHidden(true)
                .onReceive(timer) { time in
                    if (scoreMultiplier > 0) {
                        scoreMultiplier = scoreMultiplier - 1
                    }
                }
                .overlay(
                    VStack{
                        Text("Unscramble")
                            .font(.system(size: 40, weight: .heavy))
                            .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
                        HStack {
                            ForEach(Array(levelThree.1), id: \.self) { char in
                                Text(String(char))
                                    .font(.system(size: 32, weight: .bold))
                            }
                            
                        } // HSTACK
                        .fixedSize()
                        .frame(width: 332, height: 64, alignment: .center)
                        .border(Color.black, width: 2)
                        .background(Color(red: 0.92, green: 0.85, blue: 0.7))
                        .padding(.bottom, 20)
                        .font(.title)
                        
                        VStack {
                            
                            VStack {
                                
                                Spacer()
                                
                                HStack {
                                    Image("default_profile")
                                        .resizable()
                                        .frame(width: 128, height: 128)
                                    Image("sword_crossed")
                                    Image("skull")
                                        .resizable()
                                        .frame(width: 96, height: 96)
                                        .shadow(radius: 10)
                                }
                                
                                Rectangle()
                                    .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.4))
                                    .frame(width: 330)
                                
                                
                            }   .frame(width: 332, height: 186, alignment: .center)
                                .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                                .border(Color.black, width: 2)
                                .shadow(radius: 5)
                            
                            HStack {
                                TextField("GUESS", text: $userGuess)
                                    .onSubmit {
                                        submitAnswer()
                                    }
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
                            .padding(.vertical, 20)
                            
                            Button() {
                                submitAnswer()
                                
                            } label: {
                                Text("GUESS")
                                    .font(.system(size: 42, weight: .heavy))
                                    .frame(width: 150)
                                    .padding()
                                    .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                                Image("sword")
                                    .padding()
                                    .frame(width: 100)
                            } // BUTTON ->
                            .fixedSize().frame(width: 332, height: 84, alignment: .center)
                            .border(Color.black, width: 3)
                            .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                            .padding(.bottom, 10)
                            
                            Text(successMsg ?? "   ")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                            
                            if (levelWon) {
                                NavigationLink("END GAME") {
                                    WinScreenView(playerName: playerName, userPoints: score)
                                }
                                .fixedSize().frame(width: 280, height: 58, alignment: .center)// NAVIGATION LINK
                                .font(.system(size: 32, weight: .bold))
                                .border(Color.black, width: 2)
                                .background(Color(red: 0.9, green: 0.78, blue: 0.3))
                                .foregroundColor(Color(red: 0.55, green: 0.45, blue: 0.15))
                                
                            } else {
                                Text("    ")
                                    .fixedSize().frame(width: 332, height: 58, alignment: .center)
                            }
                            
                        }
                    } // VSTACK
                ) // OVERLAYS
                .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
                
                // TOAST VIEW COMPONENT
                ToastView(isVisible: $toastVisible)
                
            } // NAVIGATION STACK
        } // VIEW
        
        func submitAnswer(){
            
            if (guessWord(guess: userGuess, answer: levelThree.0)) {
                successMsg = "You Win!"
                levelWon = true
                score += scoreValue * scoreMultiplier
            } else {
                if (scoreValue > 1) {
                    scoreValue -= 1
                }
                
                // show toast to user if guess is incorrect
                toggleToast(isVisible: $toastVisible, toastTimer: &toastTimer)
            }
            
        }
    }
}
    

#Preview {
    LevelOne()
}
