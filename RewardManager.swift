import SwiftUI

class RewardManager: ObservableObject {
    @Published var earnedReward: Reward? = nil  // Ez tárolja az elért jutalmat

    private let redFruitsAndVegetables: Set<String> = [
        "Apple", "Strawberry", "Cherry", "Tomato", "Hot pepper", "Watermelon"
    ]
    
    func checkRewards(selectedItems: Set<String>, newItem: String) {
        let selectionCount = selectedItems.count  // Nem kell külön tárolni
        
        // Apple Award (minden 5. kiválasztásra)
        if selectionCount % 5 == 0 {
            earnedReward = Reward(name: "Apple Award", emoji: "🍏", text: "Congratulations! You found the Apple by eating 5 fruits and/or vegetables!")
        }
        
        // Heart Award (ha piros gyümölcs/zöldség)
        if redFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Heart Award", emoji: "🩷", text: "Congratulations! You helped your heart by eating some red fruits/vegetables!")
        }
    }
}

// Reward modell az adatok tárolására
struct Reward {
    let name: String
    let emoji: String
    let text: String
}

// Reward UI megjelenítő nézet
struct RewardView: View {
    let reward: Reward
    @Binding var isPresented: Bool
    var rewardManager: RewardManager
    var body: some View {
        VStack {
            Text(reward.emoji)
                .font(.system(size: 70))
                .padding(.bottom, 1)
            
            Text(reward.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(reward.text)
                .font(.body)
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            Button("Done") {
                isPresented = false
                rewardManager.earnedReward = nil
            }
            .fontWeight(.medium)
            .foregroundColor(.teal)
            .padding()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}
