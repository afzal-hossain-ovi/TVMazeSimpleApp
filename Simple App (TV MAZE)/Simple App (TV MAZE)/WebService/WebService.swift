//
//  WebService.swift
//  Simple App (TV MAZE)
//
//  Created by Afzal Hossain on 05.05.21.
//

import Foundation

class WebService {
    
    func getShowListData(by name: String, completion: @escaping ([ShowModel]?) -> Void) {
        
        guard let url = URL(string: "http://api.tvmaze.com/search/shows?q=\(name)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            do {
                let response = try JSONDecoder().decode([ShowModel].self, from: data)
                DispatchQueue.main.async {
                    completion(response)
                }
            }catch {
                print(error.localizedDescription)
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
