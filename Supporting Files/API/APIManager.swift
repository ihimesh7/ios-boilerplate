//
//  APIManager.swift
//  Hearty
//
//  Created by Himesh Mistry on 9/24/21.
//

import UIKit
import Combine
import SwiftyJSON

struct Model: Codable {
    
}

class APIManager: ObservableObject {
    // MARK: - Share Instance
    class var sharedInstance: APIManager {
        struct Singleton {
            static let instance = APIManager()
        }
        return Singleton.instance
    }
    
    func requestService(vc: UIViewController, completion: @escaping (Model) -> Void) {
        var cancellables = Set<AnyCancellable>()
        let apiName = ServiceKey.baseURL + APIName.name
        vc.showIndicator(withTitle: "")
        guard let url = URL(string: apiName) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("deflate,gzip", forHTTPHeaderField: "Accept-Encoding")
        URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        debugPrint(error)
                        vc.showAlert(title: "Error", msg: ErrorName.errorMsg)
                    case .finished:
                        break
                }
                vc.hideIndicator()
            } receiveValue: { result in
                debugPrint("res:")
                debugPrint(result)
                if let dict = try? JSONDecoder().decode(
                    Model.self,
                    from: result
                ) {
                    completion(dict)
                }
            }
            .store(in: &cancellables)
    }
    
    func handleOutput(_ output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode == 200 else {
            debugPrint("response:")
            debugPrint(output.response)
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    
}

// MARK: - Check Internet Connectivity
//class Connectivity {
//    class var isConnectedToInternet: Bool {
//        return NetworkReachabilityManager()!.isReachable
//    }
//}
