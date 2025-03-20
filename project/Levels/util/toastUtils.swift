// Toast Utility Function
// This file holds the design / functionality for a toast
// To be displayed to the player when they've made an incorrect guess

import SwiftUI

struct ToastView: View {
    // message displayed in toast
    let toastMessage: String = "Incorrect. Try again!"
    
    // boolean to determine whether toast is visible
    @Binding
    var isVisible: Bool
    
    var body: some View {
        // toast design
        VStack {
            if isVisible {
                Text(toastMessage)
                    .font(.system(size: 24, weight: .bold))
                    .background(Color.red)
                    .padding(5)
                    .cornerRadius(10)
            }
        }
        .foregroundStyle(.teal)
    }
}
