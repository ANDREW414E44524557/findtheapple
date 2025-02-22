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
        "Apple": "Apples are rich in fiber and vitamin C, boosting the immune system and helping to prevent heart and vascular diseases.",
        "Banana": "Bananas are high in potassium, supporting heart health, lowering blood pressure, and improving digestion.",
        "Tomato": "Tomatoes are packed with lycopene, a powerful antioxidant that may help prevent cancer and improve gut health.",
        "Carrot": "Carrots are rich in vitamin A, which improves vision and helps maintain healthy skin.",
        "Orange": "Oranges are full of vitamin C, which strengthens the immune system and helps prevent colds.",
        "Strawberry": "Strawberries are packed with antioxidants that help reduce inflammation and contribute to heart health.",
        "Lemon": "Lemons are a great source of vitamin C, aid digestion, and support detoxification.",
        "Potato": "Potatoes are a good source of carbohydrates, providing energy and promoting healthy bowel movements.",
        "Cucumber": "Cucumbers are hydrating, detoxifying, and help maintain healthy gut flora.",
        "Pineapple": "Pineapples are rich in bromelain, an enzyme that helps reduce inflammation and improve digestion.",
        "Broccoli": "Broccoli is full of antioxidants that help prevent cancer and improve the immune system.",
        "Grapes": "Grapes are packed with antioxidants, especially resveratrol, which is beneficial for heart health and slowing aging.",
        "Peach": "Peaches are rich in vitamin C, boosting the immune system and supporting gut health.",
        "Lettuce": "Lettuce is hydrating, helping with hydration and promoting healthy bowel movements.",
        "Mango": "Mangoes are high in vitamin C and A, which strengthen the immune system, improve gut health, and support skin health.",
        "Bell pepper": "Bell peppers are rich in vitamin C and antioxidants, helping prevent cardiovascular diseases.",
        "Avocado": "Avocados are high in healthy fats, especially monounsaturated fats, which help reduce the risk of heart disease.",
        "Watermelon": "Watermelon is hydrating and supports detoxification.",
        "Pear": "Pears are rich in fiber, aiding digestion and supporting heart health.",
        "Lime": "Limes are high in vitamin C, aid digestion, and support detoxification.",
        "Blueberry": "Blueberries are packed with antioxidants, strengthening the immune system and improving brain function.",
        "Melon": "Melons are hydrating and help detoxify, and are low in calories, making them ideal for weight loss.",
        "Cherry": "Cherries are full of antioxidants, helping reduce inflammation and improve heart health.",
        "Coconut": "Coconuts are rich in healthy fats and antioxidants, supporting gut health and heart health.",
        "Kiwi": "Kiwis are rich in vitamin C, boosting the immune system and promoting gut health.",
        "Corn": "Corn is high in fiber and B vitamins, aiding digestion and supporting heart health.",
        "Onion": "Onions are packed with antioxidants, helping reduce inflammation and prevent cardiovascular diseases.",
        "Eggplant": "Eggplants are rich in fiber, promoting gut health and supporting heart health.",
        "Pea": "Peas are high in protein and fiber, supporting muscle mass and contributing to heart health.",
        "Hot pepper": "Hot peppers contain capsaicin, which can aid weight loss, improve circulation, and strengthen the immune system."
    ]
    
    let vitaminA: [String: String] = [
        "Apple": "54 IU",
        "Banana": "64 IU",
        "Tomato": "833 IU",
        "Carrot": "835 µg",
        "Orange": "225 IU",
        "Strawberry": "12 IU",
        "Lemon": "22 IU",
        "Potato": "1 IU",
        "Cucumber": "105 IU",
        "Pineapple": "58 IU",
        "Broccoli": "567 IU",
        "Grapes": "66 IU",
        "Peach": "326 IU",
        "Lettuce": "74 IU",
        "Mango": "1126 IU",
        "Bell pepper": "3131 IU",
        "Avocado": "146 IU",
        "Watermelon": "112 IU",
        "Pear": "12 IU",
        "Lime": "30 IU",
        "Blueberry": "54 IU",
        "Melon": "169 IU",
        "Cherry": "16 IU",
        "Coconut": "0 IU",
        "Kiwi": "93 IU",
        "Corn": "187 IU",
        "Onion": "0 IU",
        "Eggplant": "0 IU",
        "Pea": "119 IU",
        "Hot pepper": "6300 IU"
    ]

    let vitaminB1: [String: String] = [
        "Apple": "0.03 mg",
        "Banana": "0.031 mg",
        "Tomato": "0.04 mg",
        "Carrot": "0.06 mg",
        "Orange": "0.09 mg",
        "Strawberry": "0.02 mg",
        "Lemon": "0.03 mg",
        "Potato": "0.08 mg",
        "Cucumber": "0.03 mg",
        "Pineapple": "0.08 mg",
        "Broccoli": "0.07 mg",
        "Grapes": "0.07 mg",
        "Peach": "0.04 mg",
        "Lettuce": "0.02 mg",
        "Mango": "0.05 mg",
        "Bell pepper": "0.03 mg",
        "Avocado": "0.07 mg",
        "Watermelon": "0.03 mg",
        "Pear": "0.02 mg",
        "Lime": "0.03 mg",
        "Blueberry": "0.02 mg",
        "Melon": "0.03 mg",
        "Cherry": "0.03 mg",
        "Coconut": "0.02 mg",
        "Kiwi": "0.02 mg",
        "Corn": "0.13 mg",
        "Onion": "0.05 mg",
        "Eggplant": "0.04 mg",
        "Pea": "0.13 mg",
        "Hot pepper": "0.07 mg"
    ]

    let vitaminB2: [String: String] = [
        "Apple": "0.04 mg",
        "Banana": "0.07 mg",
        "Tomato": "0.02 mg",
        "Carrot": "0.03 mg",
        "Orange": "0.04 mg",
        "Strawberry": "0.02 mg",
        "Lemon": "0.02 mg",
        "Potato": "0.03 mg",
        "Cucumber": "0.03 mg",
        "Pineapple": "0.02 mg",
        "Broccoli": "0.14 mg",
        "Grapes": "0.03 mg",
        "Peach": "0.02 mg",
        "Lettuce": "0.01 mg",
        "Mango": "0.05 mg",
        "Bell pepper": "0.02 mg",
        "Avocado": "0.09 mg",
        "Watermelon": "0.02 mg",
        "Pear": "0.04 mg",
        "Lime": "0.02 mg",
        "Blueberry": "0.03 mg",
        "Melon": "0.02 mg",
        "Cherry": "0.02 mg",
        "Coconut": "0.02 mg",
        "Kiwi": "0.02 mg",
        "Corn": "0.06 mg",
        "Onion": "0.02 mg",
        "Eggplant": "0.03 mg",
        "Pea": "0.14 mg",
        "Hot pepper": "0.04 mg"
    ]

    let energy: [String: String] = [
        "Apple": "52 kcal",
        "Banana": "89 kcal",
        "Tomato": "18 kcal",
        "Carrot": "41 kcal",
        "Orange": "47 kcal",
        "Strawberry": "32 kcal",
        "Lemon": "29 kcal",
        "Potato": "77 kcal",
        "Cucumber": "16 kcal",
        "Pineapple": "50 kcal",
        "Broccoli": "55 kcal",
        "Grapes": "69 kcal",
        "Peach": "39 kcal",
        "Lettuce": "15 kcal",
        "Mango": "60 kcal",
        "Bell pepper": "20 kcal",
        "Avocado": "160 kcal",
        "Watermelon": "30 kcal",
        "Pear": "57 kcal",
        "Lime": "30 kcal",
        "Blueberry": "57 kcal",
        "Melon": "44 kcal",
        "Cherry": "50 kcal",
        "Coconut": "354 kcal",
        "Kiwi": "61 kcal",
        "Corn": "96 kcal",
        "Onion": "40 kcal",
        "Eggplant": "25 kcal",
        "Pea": "81 kcal",
        "Hot pepper": "40 kcal"
    ]

    let vitaminB6: [String: String] = [
        "Apple": "0.041 mg",
        "Banana": "0.367 mg",
        "Tomato": "0.08 mg",
        "Carrot": "0.14 mg",
        "Orange": "0.06 mg",
        "Strawberry": "0.04 mg",
        "Lemon": "0.08 mg",
        "Potato": "0.29 mg",
        "Cucumber": "0.04 mg",
        "Pineapple": "0.11 mg",
        "Broccoli": "0.21 mg",
        "Grapes": "0.12 mg",
        "Peach": "0.06 mg",
        "Lettuce": "0.03 mg",
        "Mango": "0.26 mg",
        "Bell pepper": "0.46 mg",
        "Avocado": "0.26 mg",
        "Watermelon": "0.04 mg",
        "Pear": "0.05 mg",
        "Lime": "0.06 mg",
        "Blueberry": "0.05 mg",
        "Melon": "0.06 mg",
        "Cherry": "0.06 mg",
        "Coconut": "0.2 mg",
        "Kiwi": "0.05 mg",
        "Corn": "0.09 mg",
        "Onion": "0.12 mg",
        "Eggplant": "0.09 mg",
        "Pea": "0.12 mg",
        "Hot pepper": "0.5 mg"
    ]

    let vitaminC: [String: String] = [
        "Apple": "4.6 mg",
        "Banana": "8.7 mg",
        "Tomato": "13.7 mg",
        "Carrot": "5.9 mg",
        "Orange": "53.2 mg",
        "Strawberry": "58.8 mg",
        "Lemon": "53 mg",
        "Potato": "19.7 mg",
        "Cucumber": "2.8 mg",
        "Pineapple": "47.8 mg",
        "Broccoli": "89.2 mg",
        "Grapes": "10.8 mg",
        "Peach": "6.6 mg",
        "Lettuce": "9.2 mg",
        "Mango": "36.4 mg",
        "Bell pepper": "128.4 mg",
        "Avocado": "10 mg",
        "Watermelon": "8.1 mg",
        "Pear": "4.3 mg",
        "Lime": "30.7 mg",
        "Blueberry": "9.7 mg",
        "Melon": "18.0 mg",
        "Cherry": "10 mg",
        "Coconut": "3.3 mg",
        "Kiwi": "92.7 mg",
        "Corn": "6.8 mg",
        "Onion": "8.1 mg",
        "Eggplant": "2.2 mg",
        "Pea": "40 mg",
        "Hot pepper": "144 mg"
    ]

    let folate: [String: String] = [
        "Apple": "3 µg",
        "Banana": "20 µg",
        "Tomato": "18 µg",
        "Carrot": "19 µg",
        "Orange": "30 µg",
        "Strawberry": "24 µg",
        "Lemon": "11 µg",
        "Potato": "30 µg",
        "Cucumber": "7 µg",
        "Pineapple": "18 µg",
        "Broccoli": "63 µg",
        "Grapes": "2 µg",
        "Peach": "3 µg",
        "Lettuce": "38 µg",
        "Mango": "43 µg",
        "Bell pepper": "46 µg",
        "Avocado": "81 µg",
        "Watermelon": "3 µg",
        "Pear": "9 µg",
        "Lime": "4 µg",
        "Blueberry": "6 µg",
        "Melon": "8 µg",
        "Cherry": "3 µg",
        "Coconut": "26 µg",
        "Kiwi": "25 µg",
        "Corn": "19 µg",
        "Onion": "19 µg",
        "Eggplant": "22 µg",
        "Pea": "65 µg",
        "Hot pepper": "25 µg"
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
                    Text("Energy: \(energy[itemName] ?? "")")
                    Text("Vitamin A: \(vitaminA[itemName] ?? "")")
                    Text("Vitamin B1: \(vitaminB1[itemName] ?? "")")
                    Text("Vitamin B2: \(vitaminB2[itemName] ?? "")")
                    Text("Vitamin B6: \(vitaminB6[itemName] ?? "")")
                    Text("Vitamin C: \(vitaminC[itemName] ?? "")")
                    Text("Folate: \(folate[itemName] ?? "")")
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
