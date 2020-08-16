//
//  Network.swift
//  WeatherApp
//
//  Created by Ömer Varoğlu on 16.08.2020.
//  Copyright © 2020 Omer Varoglu. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static let shared = Network()
    let decoder = JSONDecoder()
    
    //MARK: Services func
    func getCity(completion: @escaping (_ success: Bool, Cities?) -> Void) {
        
        let url = URL(string: Constants.cityPath)
        
        self.requestWith(url: url, method: .get, parameters: nil, encoding: URLEncoding.queryString) { (response) in
            
            guard let data = response?.data else { return }
            do {
                let cityResponse = try self.decoder.decode(Cities.self, from: data)
                completion(true, cityResponse)
            } catch let jsonError {
                print("Error serializing json.Network.characters:", jsonError)
                completion(false, nil)
            }
        }
    }
}

// MARK: RequestWith
extension Network {
    func requestWith(url: URL!, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, completionHandler: @escaping (_ response: DataResponse<Any>?) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: nil)
            .debugLog()
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                print(String(data: response.data!, encoding: .utf8) ?? "")
                
                switch response.result {
                    case .success:
                        completionHandler(response)
                    case .failure(let error):
                        if response.response?.statusCode == 401 {
                            print("Network.requestWith.error.Unauthorized:", error)
                            completionHandler(nil)
                        } else {
                            print("Network.requestWith.error:", error)
                            completionHandler(nil)
                    }
                }
        }
    }
}
// MARK: Request extension
extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("================================================================================================")
        debugPrint(self)
        debugPrint("================================================================================================")
        #endif
        return self
    }
}


