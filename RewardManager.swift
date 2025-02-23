import SwiftUI

class RewardManager: ObservableObject {
    @Published var earnedReward: Reward? = nil
    

    private let redFruitsAndVegetables: Set<String> = [
        "Apple", "Strawberry", "Tomato"
    ]
    
    private let greenFruitsAndVegetables: Set<String> = [
        "Pear", "Broccoli", "Lettuce"
    ]
    
    private let yellowFruitsAndVegetables: Set<String> = [
        "Orange", "Corn", "Carrot"
    ]
    
    private let whiteFruitsAndVegetables: Set<String> = [
        "Coconut", "Garlic", "Potato"
    ]
    
    private let blueFruitsAndVegetables: Set<String> = [
        "Blueberry", "Grapes", "Eggplant"
    ]
    
    func checkRewards(selectedItems: Set<String>, newItem: String) {
        let selectionCount = selectedItems.count
        
        if selectionCount % 5 == 0 {
            earnedReward = Reward(name: "Apple Award", emoji: "🍏", text: "Congratulations! You found the Apple by eating 5 fruits and/or vegetables!")
        }
        
        if redFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Heart Award", emoji: "🩷", text: "Congratulations! You helped your heart by eating some red fruits/vegetables!")
        }

        if greenFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Peace Award", emoji: "🪷", text: "Congratulations! You reduced stress by eating some green fruits/vegetables!")
        }
        
        if yellowFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Vision Award", emoji: "👀", text: "Congratulations! You helped your vison by eating some yellow fruits/vegetables!")
        }

        if whiteFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Skeleton Award", emoji: "🍖", text: "Congratulations! You helped your bones by eating some white fruits/vegetables!")
        }
        
        if blueFruitsAndVegetables.contains(newItem) {
            earnedReward = Reward(name: "Immune Award", emoji: "💉", text: " Congratulations! You helped your immune system by eating some blue fruits/vegetables!")
        }
    }
}

struct Reward {
    let name: String
    let emoji: String
    let text: String
}

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
