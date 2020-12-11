//
//  StoreAPICodeFile.swift
//  book store
//
//  Created by codegradients on 10/12/2020.
//

import Foundation
import UIKit
protocol StoreAPIManagerDelegate {
    func didUpdate(storeReturnData: StoreReturnData)
    func didFailWithError(error: Error)
}
struct StoreAPIManager {
    var delegate: StoreAPIManagerDelegate?
    func performRequest(with storeUrl: String) {
        if let url = URL(string: storeUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("true", forHTTPHeaderField: "Skipauth")
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
    func parseJSON(_ getStoreData: Data) -> StoreReturnData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(StoreAPIData.self, from: getStoreData)
            let name = decodedData.data[0].courseName
            let price = decodedData.data[0].courseDescription
            let image = decodedData.data[1].avatarPath
            let returnValue = StoreReturnData(name: name, price: price, image: image)
            return returnValue
        }catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
