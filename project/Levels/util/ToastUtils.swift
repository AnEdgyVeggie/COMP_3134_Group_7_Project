// Toast Utility Function
// This file holds the functionality for a toast
// To be displayed to the player when they've made an incorrect guess
// (disappears on 3 seconds)

import SwiftUI

func toggleToast (isVisible: Binding<Bool>, toastTimer: inout Timer?,
                  duration: TimeInterval = 2) {
    // when function is called isVisible set to true (shows toast)
    isVisible.wrappedValue = true
    
    // stops multiple toasts popping up
    toastTimer?.invalidate()
    
    toastTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) {_ in
        DispatchQueue.main.async {
            // hide toast after timer registers 2 seconds
            isVisible.wrappedValue = false
        }
    }
}
