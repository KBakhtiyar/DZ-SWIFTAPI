import Alamofire
import Foundation

class AlamofireNetworkManager {
    
    static let shared = AlamofireNetworkManager()
    
    func getBtcElement(completion: @escaping (BtcElement?) -> Void) {
        let url = URL(string: "https://api.coincap.io/v2/assets")!
        
        AF.request(url).response { response in
            guard let data = response.data else {
                completion(nil)
                return
            }
                
                let decoder = JSONDecoder()
                do {
                    let btcElement = try decoder.decode(BtcElement.self, from: data)
                    completion(btcElement)
                    
                } catch {
                    print("error")
                    completion(nil)
                    return
                }
            }
        }
    }
   

struct BtcElement: Codable {
    let id, rank, symbol, name: String
    let supply, maxSupply, marketCapUsd, volumeUsd24Hr: String
   let priceUsd, changePercent24Hr, vwap24Hr: String
   let explorer: String
}

  typealias Btc = [BtcElement]
