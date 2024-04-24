import SwiftUI

struct ContentView: View {
    
    let alamoFireManager = AlamofireNetworkManager.shared
    
    @State var results = ""
    
    var body: some View {
        
        VStack {
            
            Image ("icons")
                .padding(.top, 150)
            
            Text("Information about Bitcoin")
                .foregroundColor(.blue)
                .padding(.bottom, 450)
            
            Text(results)
                .font(.title)
            
            Button(action: {alamoFireManager.getBtcElement { btcElement in
                if let btcElement = btcElement {
                    self.results = "\(btcElement.marketCapUsd)\n\(btcElement.volumeUsd24Hr)"
                }
              }
            }) {
                Text("Get Bitcoin Info")
            }
          }
        }
     }

#Preview {
    ContentView()
}
    
