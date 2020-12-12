//
//  StoreAPICodeFile.swift
//  book store
//
//  Created by codegradients on 10/12/2020.
//

import Foundation
import UIKit
protocol StoreAPIManagerDelegate {
    func didUpdate(storeReturnData: [StoreReturnData])
    func didFailWithError(error: Error)
}
struct StoreAPIManager {
    var delegate: StoreAPIManagerDelegate?
    func performRequest(with storeUrl: String) {
        if let url = URL(string: storeUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = K.Authorization.authGet
            request.setValue(K.Authorization.authTrue, forHTTPHeaderField: K.Authorization.SkipAuth)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let storeData = self.parseJSON(safeData) {
                        self.delegate?.didUpdate(storeReturnData: storeData)
                    }
                }
            }
            task.resume()
        }
    }
    func parseJSON(_ getStoreData: Data) -> [StoreReturnData]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(StoreAPIData.self, from: getStoreData)
            var arr: [StoreReturnData] = []
            for count in 0...3 {
            let name = decodedData.data[count].courseName
            let price = decodedData.data[count].courseDescription
            let image = decodedData.data[count].avatarPath
            let returnValue = StoreReturnData(name: name, price: price, image: image)
            arr.append(returnValue)
            }
            return arr
            
        }catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
