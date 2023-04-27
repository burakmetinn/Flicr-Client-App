//
//  NetworkManager.swift
//  Flickr Client App
//
//  Created by Burak Metin on 3.03.2023.
//

import Foundation

class NetworkManager {
    
    func fetchImages(with url : String?, competion: @escaping (Data) -> Void){
        if let urlString = url, let url = URL(string: urlString){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error{
                    debugPrint(error)
                    return
                }
                if let data = data{
                    DispatchQueue.main.async {
                        competion(data)
                    }
                }
            }.resume()
        }
    }
}
