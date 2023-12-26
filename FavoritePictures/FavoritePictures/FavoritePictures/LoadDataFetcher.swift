//
//  LoadDataFetcher.swift
//  FavoritePictures
//
//  Created by Alexander on 23.12.2023.
//

//import Foundation
//
//class LoadDataFetcher {
//    
//    let loadData = LoadData()
//    
//    func fetcherDetails(urlString: String, response: @escaping (Model?) -> Void) {
//        loadData.request(urlString: urlString) { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let details = try JSONDecoder().decode(Model.self, from: data)
//                    response(details)
//                } catch let jsonError {
//                    print("Failed to decode JSON", jsonError)
//                    response(nil)
//                }
//            case .failure(let error ):
//                print("Error received requesting data: \(error.localizedDescription)")
//                response(nil)
//            }
//        }
//    }
//}
