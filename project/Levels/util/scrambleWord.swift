// Logic for scrambling the word.

func scrambleWord(usedWords: [String]) -> String {
    // Loop controller.
    var isNewWord = false
    // Grab a random word from the predefined word list.
    var word = Words.allCases.randomElement()!

    while !isNewWord {
        // If the word has not been used before, return the value.
        if (!usedWords.contains(word.rawValue)) {
            isNewWord = true
            
            let wordChars = Array(word.rawValue)
            // Scramble the letters and return as a string to display.
            let scrambledWord = String(wordChars.shuffled())

            return ("\(scrambledWord)")
        } else {
            // Else... reroll the word and loop again until the word is unique.
            word = Words.allCases.randomElement()!
        }
    }
}
