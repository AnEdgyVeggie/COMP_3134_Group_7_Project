import SwiftUI

// Generate 3 random scrambled words for quick and easy access.
private let levelOne = scrambleWord(usedWords: [""])
private let levelTwo = scrambleWord(usedWords: [levelOne.0])
private let levelThree = scrambleWord(usedWords: [levelOne.0, levelTwo.0])

struct PlayView: View {
   
    var playerName: String = ""
    
    init(playerName: String? = "Player Name") {
        self.playerName = playerName!
        print("game started as \(playerName!)")
    }
    
    
    // Initialize navigation.
    @State
    private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            NavigationLink("PLAY LEVEL 1") {
                LevelOne()
            }
            Text(playerName)
        }
    }
}

struct LevelOne: View {
    @State
    private var path = NavigationPath()
    
    @State // User's guess.
    private var userGuess = ""
    @State // Message sent when successful.
    private var successMsg: String?
    @State // Determine if user can move on to next level.
    var levelWon = false
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
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
                                    .frame(width: 128, height: 128)
                                Image("sword_crossed")
                                Image("skull")
                                    .resizable()
                                    .frame(width: 96, height: 96)
                                    .shadow(radius: 10)
                            }
                             
                            Rectangle()
                                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.4))
//                                .fixedSize()
                                .frame(width: 330)

                            
                        }   .frame(width: 332, height: 186, alignment: .center)
                            .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                            .border(Color.black, width: 2)
                            .shadow(radius: 5)
                        
                        HStack {
                            TextField("GUESS", text: $userGuess)
                                .onSubmit {
                                    if (guessWord(guess: userGuess, answer: levelOne.0)) {
                                        successMsg = "You Win!"
                                        levelWon = true
                                    }
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
                                LevelTwo()
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
        } // NAVIGATION STACK
    } // VIEW
    
    func submitAnswer(){
        
        if (guessWord(guess: userGuess, answer: levelOne.0)) {
            successMsg = "You Win!"
            print(successMsg)
            levelWon = true
        }

    }
    
    
}


struct LevelTwo: View {
    @State
    private var path = NavigationPath()
    
    @State // User's guess.
    private var userGuess = ""
    @State // Message sent when successful.
    private var successMsg: String?
    @State // Determine if user can move on to next level.
    var levelWon = false
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
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
//                                .fixedSize()
                                .frame(width: 330)

                            
                        }   .frame(width: 332, height: 186, alignment: .center)
                            .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                            .border(Color.black, width: 2)
                            .shadow(radius: 5)
                        
                        HStack {
                            TextField("GUESS", text: $userGuess)
                                .onSubmit {
                                    if (guessWord(guess: userGuess, answer: levelTwo.0)) {
                                        successMsg = "You Win!"
                                        levelWon = true
                                    }
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
                                LevelThree()
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
        } // NAVIGATION STACK
    } // VIEW
    
    func submitAnswer() {
        if (guessWord(guess: userGuess, answer: levelTwo.0)) {
            successMsg = "You Win!"
            print(successMsg)
            levelWon = true
        }
    }
    
    
}

struct LevelThree: View {
    @State
    private var path = NavigationPath()
    
    @State // User's guess.
    private var userGuess = ""
    @State // Message sent when successful.
    private var successMsg: String?
    @State // Determine if user can move on to next level.
    var levelWon = false
    
    var body: some View {
        
        NavigationStack(path: $path) {
            ZStack {
                Color(red: 0.48, green: 0.28, blue: 0.26)
            } // ZSTACK
            .overlay(
                VStack{
                    Text("Unscramble")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.78, blue: 0.3))
//                        .padding(.vertical, 40)
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
//                                .fixedSize()
                                .frame(width: 330)

                            
                        }   .frame(width: 332, height: 186, alignment: .center)
                            .background(Color(red: 0.55, green: 0.55, blue: 0.55))
                            .border(Color.black, width: 2)
                            .shadow(radius: 5)
                        
                        HStack {
                            TextField("GUESS", text: $userGuess)
                                .onSubmit {
                                    if (guessWord(guess: userGuess, answer: levelThree.0)) {
                                        successMsg = "You Win!"
                                        levelWon = true
                                    }
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
                        

                        Text("    ")
                            .fixedSize().frame(width: 332, height: 58, alignment: .center)
                    
                    }
                } // VSTACK
            ) // OVERLAYS
            .background(Color(red: 0.2, green: 0.1, blue: 0.1 ))
        } // NAVIGATION STACK
    } // VIEW
    
    func submitAnswer() {
        if (guessWord(guess: userGuess, answer: levelThree.0)) {
            successMsg = "You Win!"
            print(successMsg)
            levelWon = true
        }
    }
    
    
}

//struct LevelThree: View {
//    @State
//    private var path = NavigationPath()
//    
//    @State // User's guess.
//    private var userGuess = ""
//    @State // Message sent when successful.
//    private var successMsg: String?
//    @State // Determine if user can move on to next level.
//    var levelWon = false
//    
//    var body: some View {
//        // Show the word to unscramble.
//        Text(levelThree.1)
//        
//        VStack{
//            TextField("GUESS", text: $userGuess)
//                .onSubmit {
//                    if (guessWord(guess: userGuess, answer: levelThree.0)) {
//                        successMsg = "You Win!"
//                        levelWon = true
//                    }
//                }
//        }
//        
//        Text(successMsg ?? "")
//    }
//}

#Preview {
    PlayView()
}
