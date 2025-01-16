import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Home Tab
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            // Achievements Tab
            Text("Achievements Screen")
                .tabItem {
                    Label("Achievements", systemImage: "star.fill")
                }

            // Statistics Tab
            Text("Statistics Screen")
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar.fill")
                }

            // Fun Facts Tab
            Text("Fun Facts Screen")
                .tabItem {
                    Label("Fun Facts", systemImage: "leaf.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
