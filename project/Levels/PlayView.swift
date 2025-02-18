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
    
    var body: some View {
        NavigationStack(path: $path) {
            // Show the word to unscramble.
            Text(levelOne.1)
            
            NavigationLink("PLAY LEVEL 2") {
                LevelTwo()
            }
        }
    }
}

struct LevelTwo: View {
    @State
    private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // Show the word to unscramble.
            Text(levelTwo.1)
            
            NavigationLink("PLAY LEVEL 3") {
                LevelThree()
            }
        }
    }
}

struct LevelThree: View {
    var body: some View {
        Text(levelThree.1)
    }
}

#Preview {
    PlayView()
}
