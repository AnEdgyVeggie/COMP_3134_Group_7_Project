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
            return ("\(word.rawValue)")
        } else {
            // Else... reroll the word and loop again until the word is unique.
            word = Words.allCases.randomElement()!
        }
    }
}
