import SwiftUI

struct DataView: View {
    let itemName: String
    
    let emojiDict: [String: String] = [
        "Apple": "🍎",
        "Orange": "🍊",
        "Strawberry": "🍓",
        "Lemon": "🍋",
        "Potato": "🥔",
        "Cucumber": "🥒",
        "Pineapple": "🍍",
        "Broccoli": "🥦",
        "Grapes": "🍇",
        "Peach": "🍑",
        "Avocado": "🥑",
        "Kiwi": "🥝",
        "Watermelon": "🍉",
        "Blueberry": "🫐",
        "Mango": "🥭",
        "Banana": "🍌",
        "Tomato": "🍅",
        "Carrot": "🥕",
        "Pear": "🍐",
        "Lime": "🍋‍🟩",
        "Melon": "🍈",
        "Lettuce": "🥬",
        "Cherry": "🍒",
        "Coconut": "🥥",
        "Corn": "🌽",
        "Onion": "🧅",
        "Eggplant": "🍆",
        "Pea": "🫛",
        "Bell pepper": "🫑",
        "Hot pepper": "🌶️",
    ]
    
    let description: [String: String] = [
        "Apple": "A crunchy, juicy fruit.",
        "Banana": "A sweet, soft fruit.",
        "Tomato": "Yes, it's a fruit! :)",
        "Carrot": "A crunchy, orange vegetable.",
        "Orange": "A tangy, citrus fruit.",
        "Strawberry": "A sweet, red berry.",
        "Lemon": "A sour, yellow citrus fruit.",
        "Potato": "A starchy, earthy vegetable.",
        "Cucumber": "A cool, watery vegetable.",
        "Pineapple": "A tropical fruit with spikes.",
        "Broccoli": "A vegetable with tree-like florets.",
        "Grapes": "Small, sweet, and in bunches.",
        "Peach": "A fuzzy fruit with juicy flesh.",
        "Lettuce": "A leafy vegetable often used in salads.",
        "Mango": "A sweet tropical fruit.",
        "Bell pepper": "A crunchy vegetable with various colors.",
        "Avocado": "A green fruit with a large seed.",
        "Watermelon": "A sweet, juicy, and refreshing fruit.",
        "Pear": "A sweet fruit with a smooth texture.",
        "Lime": "A tangy citrus fruit often used in drinks.",
        "Blueberry": "A tiny, sweet, and tangy berry.",
        "Melon": "A sweet fruit, often enjoyed in summer.",
        "Cherry": "A small, round, sweet fruit.",
        "Coconut": "A tropical fruit with a hard shell.",
        "Kiwi": "A small, fuzzy fruit with green center.",
        "Corn": "A starchy vegetable with yellow kernels.",
        "Onion": "A bulbous vegetable with a strong, flavor.",
        "Eggplant": "A purple vegetable with a mild taste.",
        "Pea": "A small vegetable that grows in pods.",
        "Hot pepper": "A spicy vegetable with a fiery kick."
    ]

    let aboutText: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let vitaminA: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let vitaminB1: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let vitaminB2: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let energy: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let vitaminB6: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let vitaminC: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]
    
    let folate: [String: String] = [
        "Apple": "",
        "Banana": "",
        "Tomato": "",
        "Carrot": "",
        "Orange": "",
        "Strawberry": "",
        "Lemon": "",
        "Potato": "",
        "Cucumber": "",
        "Pineapple": "",
        "Broccoli": "",
        "Grapes": "",
        "Peach": "",
        "Lettuce": "",
        "Mango": "",
        "Bell pepper": "",
        "Avocado": "",
        "Watermelon": "",
        "Pear": "",
        "Lime": "",
        "Blueberry": "",
        "Melon": "",
        "Cherry": "",
        "Coconut": "",
        "Kiwi": "",
        "Corn": "",
        "Onion": "",
        "Eggplant": "",
        "Pea": "",
        "Hot pepper": ""
    ]

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text(emojiDict[itemName] ?? "")
                    .font(.system(size: 70))
                    .padding(.bottom, 1)
                
                Text(itemName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(description[itemName] ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                Text(aboutText[itemName] ?? "")
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                Divider()
                
                List {
                    Text("Vitamin A: \(vitaminA[itemName] ?? "")")
                    Text("Vitamin B: \(vitaminB[itemName] ?? "")")
                    Text("Vitamin B1: \(vitaminB1[itemName] ?? "")")
                    Text("Vitamin B2: \(vitaminB2[itemName] ?? "")")
                    Text("Vitamin B3: \(vitaminB3[itemName] ?? "")")
                    Text("Vitamin B6: \(vitaminB6[itemName] ?? "")")
                    Text("Vitamin B9: \(vitaminB9[itemName] ?? "")")
                    Text("Vitamin C: \(vitaminC[itemName] ?? "")")
                    Text("Vitamin D: \(vitaminD[itemName] ?? "")")
                    Text("Vitamin E: \(vitaminE[itemName] ?? "")")
                    Text("Vitamin F: \(vitaminF[itemName] ?? "")")
                    Text("Vitamin K: \(vitaminK[itemName] ?? "")")
                    Text("Vitamin P: \(vitaminP[itemName] ?? "")")
                    Text("Iron: \(iron[itemName] ?? "")")
                    Text("Potassium: \(potassium[itemName] ?? "")")
                    Text("Calium: \(calium[itemName] ?? "")")
                    
                }
                .listStyle(InsetGroupedListStyle())
            }
            .background(Color.white)
            .cornerRadius(20)
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.medium)
                    .foregroundColor(.teal)
                    .padding()
                }
            }
        }
    }
}
