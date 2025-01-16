import SwiftUI
import Charts

struct HomeScreen: View {
    // Aktuális coin értékek
    @State private var greenAppleCoins = 0
    @State private var redAppleCoins = 0

    // Vitamin intake (mg) adatok
    @State private var vitaminIntake: [(String, Double)] = [
        ("C", 0.0), ("A", 0.0), ("K", 0.0), ("D", 0.0)
    ]

    // Cukorfogyasztás (gramm) adatok
    @State private var sugarIntake: [(String, Double)] = []

    var body: some View {
        VStack(spacing: 16) {
            // Felső bar
            HStack {
                Button(action: {
                    // Settings gomb akció
                }) {
                    Text("Settings")
                        .foregroundColor(.teal)
                }
                
                Spacer()
                
                HStack {
                    Text("🍏 \(greenAppleCoins)")
                    Text("🍎 \(redAppleCoins)")
                }
                .font(.headline)
            }
            .padding(.horizontal)

            // Title
            HStack {
                Text("An apple a day...")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal)

            // Vitamin intake diagram
            Text("Vitamin intake this day")
                .font(.headline)
                .padding(.top, 8)

            Chart {
                ForEach(vitaminIntake, id: \.0) { vitamin, amount in
                    BarMark(
                        x: .value("Vitamin", vitamin),
                        y: .value("Amount (mg)", amount)
                    )
                    .foregroundStyle(Color.teal)
                }
            }
            .frame(height: 150)
            .padding()
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            )

            // Sugar intake diagram
            Text("Sugar intake this week")
                .font(.headline)
                .padding(.top, 8)

            Chart {
                ForEach(sugarIntake, id: \.0) { day, grams in
                    LineMark(
                        x: .value("Day", day),
                        y: .value("Sugar (g)", grams)
                    )
                    .foregroundStyle(Color.orange)
                    .interpolationMethod(.catmullRom)
                }
            }
            .frame(height: 150)
            .padding()
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            )

            Spacer()
            Button(action: {
                print("Scan gomb megnyomva!")
            }) {
                Text("Scan")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .cornerRadius(30)
                    .padding()
            }
        }
        .padding()
        .onAppear {
            updateSugarIntake()
        }
    }

    /// Frissíti az elmúlt öt nap nevét és nullázza az értékeket
    private func updateSugarIntake() {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // Rövid napnevek, pl. "Mon", "Tue"

        // Generáljuk az elmúlt öt nap neveit és 0 értékeket
        sugarIntake = (0..<5).reversed().map { offset in
            let date = calendar.date(byAdding: .day, value: -offset, to: Date()) ?? Date()
            let dayName = dateFormatter.string(from: date)
            return (dayName, 0.0) // Kezdetben minden érték 0
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
