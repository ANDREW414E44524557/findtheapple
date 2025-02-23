import SwiftUI

struct WelcomeView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("🍏")
                .font(.system(size: 85))
                .padding(.bottom, 1)
            
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Hello from the developer of FindTheApple!")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            ScrollView {
                Text("🍏 The WHO recommends that eating 5 servings of fruit and vegetables a day is the key to a healthy life. The FindTheApple app is designed to help people eat the recommended 5 servings of fruits and vegetables a day, eat more consciously and lead a healthier lifestyle.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("🍏 The Rainbow Diet recommends eating foods rich in different colors for a healthy lifestyle and disease prevention.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("🍏 Food colors generally indicate nutrients and phytochemicals (biologically active compounds found in plants) that are important for maintaining good health.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("🍏 Eating a rainbow diet can reduce the risk of chronic diseases such as obesity, cardiovascular disease, cancer and diabetes.")
                    .font(.body)
                    .padding(.bottom, 10)
                
                Text("🍏 The app counts fruits/veggies when 5 are selected per day, gives a reward, and provides monthly statistics on fruit/veggie consumption.")
                    .font(.body)
                
            }
            
            Spacer()
            
            Button("Let's jump in!") {
                dismiss()
            }
            .padding()
            .background(Color.teal)
            .foregroundColor(.white)
            .cornerRadius(25)
        }
        .padding()
    }
}
