import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "Fruits"
    @State private var selectedItemName: String = ""
    @State private var showDataView: Bool = false
    @State private var selectedItems: Set<String> = []
    @StateObject private var rewardManager = RewardManager()
    @State private var showReward = false

    var categories = ["Fruits", "Vegetables"]
    
    var filteredFruits: [FruitView] {
        let fruits = [
            FruitView(emoji: "🍎", name: "Apple", action: showData, color: .red, isSelected: selectedItems.contains("Apple"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍐", name: "Pear", action: showData, color: .green, isSelected: selectedItems.contains("Pear"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍊", name: "Orange", action: showData, color: .orange, isSelected: selectedItems.contains("Orange"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍋", name: "Lemon", action: showData, color: .yellow, isSelected: selectedItems.contains("Lemon"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍋‍🟩", name: "Lime", action: showData, color: .yellow, isSelected: selectedItems.contains("Lime"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍌", name: "Banana", action: showData, color: .yellow, isSelected: selectedItems.contains("Banana"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍉", name: "Watermelon", action: showData, color: .pink, isSelected: selectedItems.contains("Watermelon"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍇", name: "Grapes", action: showData, color: .purple, isSelected: selectedItems.contains("Grapes"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍓", name: "Strawberry", action: showData, color: .red, isSelected: selectedItems.contains("Strawberry"), toggleSelection: toggleSelection),
            FruitView(emoji: "🫐", name: "Blueberry", action: showData, color: .blue, isSelected: selectedItems.contains("Blueberry"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍈", name: "Melon", action: showData, color: .yellow, isSelected: selectedItems.contains("Melon"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍒", name: "Cherry", action: showData, color: .red, isSelected: selectedItems.contains("Cherry"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍑", name: "Peach", action: showData, color: .orange, isSelected: selectedItems.contains("Peach"), toggleSelection: toggleSelection),
            FruitView(emoji: "🥭", name: "Mango", action: showData, color: .yellow, isSelected: selectedItems.contains("Mango"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍍", name: "Pineapple", action: showData, color: .yellow, isSelected: selectedItems.contains("Pineapple"), toggleSelection: toggleSelection),
            FruitView(emoji: "🥥", name: "Coconut", action: showData, color: .brown, isSelected: selectedItems.contains("Coconut"), toggleSelection: toggleSelection),
            FruitView(emoji: "🥝", name: "Kiwi", action: showData, color: .green, isSelected: selectedItems.contains("Kiwi"), toggleSelection: toggleSelection),
            FruitView(emoji: "🍅", name: "Tomato", action: showData, color: .red, isSelected: selectedItems.contains("Tomato"), toggleSelection: toggleSelection)
        ]
        return fruits.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var filteredVegetables: [VegetableView] {
        let vegetables = [
            VegetableView(emoji: "🍆", name: "Eggplant", action: showData, color: .purple, isSelected: selectedItems.contains("Eggplant"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥑", name: "Avocado", action: showData, color: .green, isSelected: selectedItems.contains("Avocado"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🫛", name: "Peas", action: showData, color: .green, isSelected: selectedItems.contains("Peas"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥦", name: "Broccoli", action: showData, color: .green, isSelected: selectedItems.contains("Broccoli"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥬", name: "Lettuce", action: showData, color: .green, isSelected: selectedItems.contains("Lettuce"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥒", name: "Cucumber", action: showData, color: .green, isSelected: selectedItems.contains("Cucumber"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🌶️", name: "Hot pepper", action: showData, color: .red, isSelected: selectedItems.contains("Hot pepper"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🫑", name: "Bell pepper", action: showData, color: .green, isSelected: selectedItems.contains("Bell pepper"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🌽", name: "Corn", action: showData, color: .yellow, isSelected: selectedItems.contains("Corn"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥕", name: "Carrot", action: showData, color: .orange, isSelected: selectedItems.contains("Carrot"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🫒", name: "Olive", action: showData, color: .green, isSelected: selectedItems.contains("Olive"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🧄", name: "Garlic", action: showData, color: .brown, isSelected: selectedItems.contains("Garlic"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🧅", name: "Onion", action: showData, color: .yellow, isSelected: selectedItems.contains("Onion"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🥔", name: "Potato", action: showData, color: .brown, isSelected: selectedItems.contains("Potato"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🍠", name: "Sweet potato", action: showData, color: .orange, isSelected: selectedItems.contains("Sweet potato"), toggleSelection: toggleSelection),
            VegetableView(emoji: "🫚", name: "Ginger", action: showData, color: .brown, isSelected: selectedItems.contains("Ginger"), toggleSelection: toggleSelection),
        ]
        return vegetables.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    func showData(itemName: String) {
        selectedItemName = itemName
        showDataView = true
    }
    
    func toggleSelection(itemName: String) {
        if selectedItems.contains(itemName) {
            selectedItems.remove(itemName)
        } else {
            selectedItems.insert(itemName)
            rewardManager.checkRewards(selectedItems: selectedItems, newItem: itemName)
            
            if rewardManager.earnedReward != nil {
                showReward = true
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.2)))
                .font(.system(size: 18))
                .padding(.horizontal)
            
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \ .self) { category in
                    Text(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    if selectedCategory == "Fruits" {
                        ForEach(filteredFruits, id: \ .name) { fruit in
                            fruit
                        }
                    } else if selectedCategory == "Vegetables" {
                        ForEach(filteredVegetables, id: \ .name) { vegetable in
                            vegetable
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("FindTheApple")
        .sheet(isPresented: $showDataView) {
            DataView(itemName: selectedItemName)
        }
        .sheet(isPresented: $showReward) {
            if let reward = rewardManager.earnedReward {
                RewardView(reward: reward, isPresented: $showReward, rewardManager: rewardManager)
            }
        }
    }
}

struct FruitView: View {
    let emoji: String
    let name: String
    let action: (String) -> Void
    let color: Color
    let isSelected: Bool
    let toggleSelection: (String) -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text(emoji)
                    .font(.system(size: 53))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: 30).fill(color.opacity(0.2)))
                    .onTapGesture { action(name) }
                
                Text(name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .onTapGesture { action(name) }
            }
            
            Button(action: { toggleSelection(name) }) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.teal)
                    .padding(8)
            }
        }
    }
}

struct VegetableView: View {
    let emoji: String
    let name: String
    let action: (String) -> Void
    let color: Color
    let isSelected: Bool
    let toggleSelection: (String) -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Text(emoji)
                    .font(.system(size: 53))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(RoundedRectangle(cornerRadius: 30).fill(color.opacity(0.2)))
                    .onTapGesture { action(name) }
                
                Text(name)
                    .font(.headline)
                    .foregroundColor(.black)
                    .onTapGesture { action(name) }
            }
            
            Button(action: { toggleSelection(name) }) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.teal)
                    .padding(8)
            }
        }
    }
}
