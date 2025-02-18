// Logic for guessing the word.
    // Should probably make a "successful" guess an object that returns:
        // Time taken.
        // Score achieved.
        // Amount of guesses (pass in amt of attempts taken at each call as param?).

func guessWord(guess: String, answer: String) -> Bool {
    if guess.uppercased() == answer {
        return true
    } else {
        return false
    }
}
