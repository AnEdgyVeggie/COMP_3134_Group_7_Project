import SwiftUI

// Generate 3 random scrambled words for quick and easy access.
private let levelOne = scrambleWord(usedWords: [""])
private let levelTwo = scrambleWord(usedWords: [levelOne.0])
private let levelThree = scrambleWord(usedWords: [levelOne.0, levelTwo.0])

struct PlayView: View {
    
    // Initialize navigation.
    @State
    private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            NavigationLink("PLAY LEVEL 1") {
                LevelOne()
            }
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
            // Show the word to unscramble.
            Text(levelOne.1)
            
            VStack{
                TextField("GUESS", text: $userGuess)
                    .onSubmit {
                        if (guessWord(guess: userGuess, answer: levelOne.0)) {
                            successMsg = "You Win!"
                            levelWon = true
                        }
                    }
            }
            
            Text(successMsg ?? "")
            
            if (levelWon) {
                NavigationLink("PLAY LEVEL 2") {
                    LevelTwo()
                }
            }
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
            // Show the word to unscramble.
            Text(levelTwo.1)
            
            VStack{
                TextField("GUESS", text: $userGuess)
                    .onSubmit {
                        if (guessWord(guess: userGuess, answer: levelTwo.0)) {
                            successMsg = "You Win!"
                            levelWon = true
                        }
                    }
            }
            
            Text(successMsg ?? "")
            
            if (levelWon) {
                NavigationLink("PLAY LEVEL 3") {
                    LevelThree()
                }
            }
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
        // Show the word to unscramble.
        Text(levelThree.1)
        
        VStack{
            TextField("GUESS", text: $userGuess)
                .onSubmit {
                    if (guessWord(guess: userGuess, answer: levelThree.0)) {
                        successMsg = "You Win!"
                        levelWon = true
                    }
                }
        }
        
        Text(successMsg ?? "")
    }
}

#Preview {
    PlayView()
}
