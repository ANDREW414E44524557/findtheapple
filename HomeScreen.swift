import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "Fruits"
    @State private var selectedItemName: String = ""
    @State private var showDataView: Bool = false
    @StateObject private var selectionManager = SelectionManager()

    var categories = ["Fruits", "Vegetables", "Rainbow"]
    
    var filteredFruits: [FruitView] {
        let fruits = [
            FruitView(emoji: "🍎", name: "Apple", action: showData, color: .red),
            FruitView(emoji: "🍐", name: "Pear", action: showData, color: .green),
            FruitView(emoji: "🍊", name: "Orange", action: showData, color: .orange),
            FruitView(emoji: "🍋", name: "Lemon", action: showData, color: .yellow),
            FruitView(emoji: "🍋‍🟩", name: "Lime", action: showData, color: .yellow),
            FruitView(emoji: "🍌", name: "Banana", action: showData, color: .yellow),
            FruitView(emoji: "🍉", name: "Watermelon", action: showData, color: .pink),
            FruitView(emoji: "🍇", name: "Grapes", action: showData, color: .purple),
            FruitView(emoji: "🍓", name: "Strawberry", action: showData, color: .red),
            FruitView(emoji: "🫐", name: "Blueberry", action: showData, color: .blue),
            FruitView(emoji: "🍈", name: "Melon", action: showData, color: .yellow),
            FruitView(emoji: "🍒", name: "Cherry", action: showData, color: .red),
            FruitView(emoji: "🍑", name: "Peach", action: showData, color: .orange),
            FruitView(emoji: "🥭", name: "Mango", action: showData, color: .yellow),
            FruitView(emoji: "🍍", name: "Pineapple", action: showData, color: .yellow),
            FruitView(emoji: "🥥", name: "Coconut", action: showData, color: .brown),
            FruitView(emoji: "🥝", name: "Kiwi", action: showData, color: .green),
            FruitView(emoji: "🍅", name: "Tomato", action: showData, color: .red)
        ]
        return fruits.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var filteredVegetables: [VegetableView] {
        let vegetables = [
            VegetableView(emoji: "🍆", name: "Eggplant", action: showData, color: .purple),
            VegetableView(emoji: "🥑", name: "Avocado", action: showData, color: .green),
            VegetableView(emoji: "🫛", name: "Peas", action: showData, color: .green),
            VegetableView(emoji: "🥦", name: "Broccoli", action: showData, color: .green),
            VegetableView(emoji: "🥬", name: "Lettuce", action: showData, color: .green),
            VegetableView(emoji: "🥒", name: "Cucumber", action: showData, color: .green),
            VegetableView(emoji: "🌶️", name: "Hot pepper", action: showData, color: .red),
            VegetableView(emoji: "🫑", name: "Bell pepper", action: showData, color: .green),
            VegetableView(emoji: "🌽", name: "Corn", action: showData, color: .yellow),
            VegetableView(emoji: "🥕", name: "Carrot", action: showData, color: .orange),
            VegetableView(emoji: "🫒", name: "Olive", action: showData, color: .green),
            VegetableView(emoji: "🧄", name: "Garlic", action: showData, color: .brown),
            VegetableView(emoji: "🧅", name: "Onion", action: showData, color: .yellow),
            VegetableView(emoji: "🥔", name: "Potato", action: showData, color: .brown),
            VegetableView(emoji: "🍠", name: "Sweet potato", action: showData, color: .orange),
        ]
        return vegetables.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var rainbowItems: [RainbowItemView] {
        let rainbowItems = [
            RainbowItemView(emoji: "🍎", name: "Apple", color: .red),
            RainbowItemView(emoji: "🍊", name: "Orange", color: .orange),
            RainbowItemView(emoji: "🍋", name: "Lemon", color: .yellow),
            RainbowItemView(emoji: "🍉", name: "Watermelon", color: .pink),
            RainbowItemView(emoji: "🍇", name: "Grapes", color: .purple),
            RainbowItemView(emoji: "🫐", name: "Blueberry", color: .blue),
            RainbowItemView(emoji: "🥦", name: "Broccoli", color: .green),
        ]
        return rainbowItems.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    func showData(itemName: String) {
        selectedItemName = itemName
        showDataView = true
        selectionManager.addSelection()
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                TextField("Search...", text: $searchText)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.gray.opacity(0.2)))
                    .font(.system(size: 18))
                    .padding(.horizontal)
                
                if searchText.isEmpty {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 40)
                        
                        HStack(spacing: 0) {
                            ForEach(categories, id: \.self) { category in
                                Button(action: { selectedCategory = category }) {
                                    Text(category)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(selectedCategory == category ? Color.white.opacity(0.8) : Color.clear)
                                        )
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        if selectedCategory == "Fruits" {
                            ForEach(filteredFruits, id: \.name) { fruit in
                                fruit
                            }
                        } else if selectedCategory == "Vegetables" {
                            ForEach(filteredVegetables, id: \.name) { vegetable in
                                vegetable
                            }
                        } else if selectedCategory == "Rainbow" {
                            ForEach(rainbowItems, id: \.name) { rainbowItem in
                                RainbowItemView(emoji: rainbowItem.emoji, name: rainbowItem.name, color: rainbowItem.color) // Itt helyesen hívom meg
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }

            // Gratulációs üzenet
            if selectionManager.showCongratsMessage {
                VStack {
                    Spacer()
                    Text("🎉 Congratulations! You earned a reward! 🍏")
                        .font(.title)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.9)))
                        .shadow(radius: 10)
                        .padding()
                }
                .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut, value: selectionManager.hasEarnedReward)
        .navigationTitle("FindTheApple")
        .sheet(isPresented: $showDataView) {
            DataView(itemName: selectedItemName)
        }
    }
}

struct FruitView: View {
    let emoji: String
    let name: String
    let action: (String) -> Void
    let color: Color  // Szín hozzáadása
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 53))
                .frame(width: 133, height: 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(color.opacity(0.2)))  // Szín beállítása
                .onTapGesture { action(name) }
            
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
                .onTapGesture { action(name) }
        }
    }
}

struct VegetableView: View {
    let emoji: String
    let name: String
    let action: (String) -> Void
    let color: Color  // Szín hozzáadása
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 53))
                .frame(width: 133, height: 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(color.opacity(0.2)))  // Szín beállítása
                .onTapGesture { action(name) }
            
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
                .onTapGesture { action(name) }
        }
    }
}

struct RainbowItemView: View {
    let emoji: String
    let name: String
    let color: Color  // Szín hozzáadása
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 53))
                .frame(width: 133, height: 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(color.opacity(0.2)))  // Szín beállítása
            
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}
