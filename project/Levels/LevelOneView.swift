// Keep track of which word is used in each level so there are no duplicates.

import SwiftUI

struct LevelOneView: View {
    
    var body: some View {
        
        Text(scrambleWord(usedWords: [""]))
    }
}

#Preview {
    LevelOneView()
}
