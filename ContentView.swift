import SwiftUI

struct ContentView: View {
    @State private var isWelcomePresented = true

    var body: some View {
        HomeScreen()
            .sheet(isPresented: $isWelcomePresented) {
                WelcomeView()
            }
    }
}
