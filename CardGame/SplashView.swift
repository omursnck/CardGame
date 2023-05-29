
import SwiftUI

struct SplashView: View {
    @Binding var showSplash: Bool
       var onDismiss: () -> Void
    var body: some View {
        let reasons = [
            "Impaired Judgment: Alcohol can impair your judgment, leading to poor decision-making and potentially dangerous situations.",
            "Health Risks: Long-term alcohol abuse can have detrimental effects on your physical health.",
            "Addiction and Dependency: Alcohol is highly addictive, and excessive use can lead to alcohol dependence or alcoholism.",
            "Mental Health Issues: Alcohol abuse can contribute to or worsen mental health problems such as depression and anxiety."
        ]
        
      
        ZStack {
            Color.orange
                .ignoresSafeArea()
            ScrollView {
                      Text("Serefe: Party Game")
                          .font(.system(size: 30))
                          .bold()
                          .foregroundColor(.white)
                          .padding(.top, 50)
                      VStack(spacing: 16) {
                          ForEach(reasons, id: \.self) { reason in
                              ReasonView(reason: reason)
                          }
                          
                          Button(action: {
                                       withAnimation {
                                           showSplash = false
                                       }
                                       onDismiss()
                                   }) {
                                       Text("I Understand")
                                           .foregroundColor(.white)
                                           .padding(.vertical, 10)
                                           .padding(.horizontal, 20)
                                           .background(Color.blue)
                                           .cornerRadius(8)
                                   }.padding(.top)
                      }
                      .padding()
                  }
            .navigationTitle("Warning!")
        }
          }
      }

struct ReasonView: View {
    let reason: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(reason)
                .font(.headline)
                .foregroundColor(.primary)
                .padding()
            
            Divider()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
