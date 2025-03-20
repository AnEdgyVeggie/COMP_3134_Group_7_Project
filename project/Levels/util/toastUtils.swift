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
        if isVisible {
            ZStack {
                Color(red: 0.92, green: 0.85, blue: 0.7)
                    // removing white space below toast
                    .ignoresSafeArea(.all, edges: .bottom)
                
                Text(toastMessage)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.black)
                    .padding()
            }
            .frame(maxHeight: 35)
        }
    }
}
