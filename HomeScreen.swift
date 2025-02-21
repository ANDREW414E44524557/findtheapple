import SwiftUI

struct HomeScreen: View {
    @State private var searchText: String = ""
    @State private var selectedCategory: String = "Fruits"
    @State private var selectedItemName: String = ""
    @State private var showDataView: Bool = false
    @StateObject private var selectionManager = SelectionManager()

    var categories = ["Fruits", "Vegetables"]
    
    var filteredFruits: [FruitView] {
        let fruits = [
            FruitView(emoji: "🍎", name: "Apple", action: showData),
            FruitView(emoji: "🍐", name: "Pear", action: showData),
            FruitView(emoji: "🍊", name: "Orange", action: showData),
            FruitView(emoji: "🍋", name: "Lemon", action: showData),
            FruitView(emoji: "🍋‍🟩", name: "Lime", action: showData),
            FruitView(emoji: "🍌", name: "Banana", action: showData),
            FruitView(emoji: "🍉", name: "Watermelon", action: showData),
            FruitView(emoji: "🍇", name: "Grapes", action: showData),
            FruitView(emoji: "🍓", name: "Strawberry", action: showData),
            FruitView(emoji: "🫐", name: "Blueberry", action: showData),
            FruitView(emoji: "🍈", name: "Melon", action: showData),
            FruitView(emoji: "🍒", name: "Cherry", action: showData),
            FruitView(emoji: "🍑", name: "Peach", action: showData),
            FruitView(emoji: "🥭", name: "Mango", action: showData),
            FruitView(emoji: "🍍", name: "Pineapple", action: showData),
            FruitView(emoji: "🥥", name: "Coconut", action: showData),
            FruitView(emoji: "🥝", name: "Kiwi", action: showData),
            FruitView(emoji: "🍅", name: "Tomato", action: showData)
        ]
        return fruits.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }

    var filteredVegetables: [VegetableView] {
        let vegetables = [
            VegetableView(emoji: "🥕", name: "Carrot", action: showData),
            VegetableView(emoji: "🌽", name: "Corn", action: showData),
            VegetableView(emoji: "🥔", name: "Potato", action: showData),
            VegetableView(emoji: "🧅", name: "Onion", action: showData),
            VegetableView(emoji: "🥑", name: "Avocado", action: showData),
            VegetableView(emoji: "🍆", name: "Eggplant", action: showData),
            VegetableView(emoji: "🫛", name: "Pea", action: showData),
            VegetableView(emoji: "🫑", name: "Bell pepper", action: showData),
            VegetableView(emoji: "🌶️", name: "Hot pepper", action: showData),
            VegetableView(emoji: "🥦", name: "Broccoli", action: showData),
            VegetableView(emoji: "🥒", name: "Cucumber", action: showData),
            VegetableView(emoji: "🥬", name: "Lettuce", action: showData),
        ]
        return vegetables.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
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
                            ForEach(filteredFruits, id: \.name) { fruit in fruit }
                        } else {
                            ForEach(filteredVegetables, id: \.name) { vegetable in vegetable }
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
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 53))
                .frame(width: 133, height: 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)))
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
    
    var body: some View {
        VStack {
            Text(emoji)
                .font(.system(size: 53))
                .frame(width: 133, height: 100)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)))
                .onTapGesture { action(name) }
            
            Text(name)
                .font(.headline)
                .foregroundColor(.black)
                .onTapGesture { action(name) }
        }
    }
}
