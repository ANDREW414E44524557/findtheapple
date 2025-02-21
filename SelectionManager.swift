import SwiftUI

class SelectionManager: ObservableObject {
    @Published var selections: [Date] = []
    @Published var hasEarnedReward = false
    @Published var showConfetti = false
    @Published var showCongratsMessage = false
    
    private let key = "fruitSelections"
    
    init() {
        loadSelections()
        resetOldSelections()
    }
    
    @MainActor
    func addSelection() {
        let now = Date()
        selections.append(now)
        resetOldSelections()
        saveSelections()
        
        checkForReward()
    }
    
    func saveSelections() {
        let data = selections.map { $0.timeIntervalSince1970 }
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadSelections() {
        let data = UserDefaults.standard.array(forKey: key) as? [TimeInterval] ?? []
        selections = data.map { Date(timeIntervalSince1970: $0) }
    }
    
    func resetOldSelections() {
        let now = Date()
        selections = selections.filter { now.timeIntervalSince($0) < 86400 }
        saveSelections()
    }
    
    @MainActor
    func checkForReward() {
        if selections.count >= 5 && !hasEarnedReward {
            hasEarnedReward = true
            showCongratsMessage = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
                Task { @MainActor in
                    self?.showCongratsMessage = false
                }
            }
        }
    }
}
