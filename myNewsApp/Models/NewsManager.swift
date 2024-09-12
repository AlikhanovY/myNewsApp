//
//  NewsManager.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 05.09.2024.
//

import Foundation

struct NewsManager{    
    typealias CompletionHandler = (NewsData) -> Void
    
    let newsApi = "https://newsapi.org/v2/everything?q=Apple&from=2024-09-01&sortBy=popularity&apiKey=e16f87027018476481f2366c3d5eaa5e"
    
    func fetchNews(requestName : String, completion: @escaping CompletionHandler){
        let urlString = "https://newsapi.org/v2/everything?q=\(requestName)&from=2024-09-06&sortBy=popularity&apiKey=e16f87027018476481f2366c3d5eaa5e"
        performRequest(urlString: urlString, completion: completion)
    }
    func performRequest(urlString: String, completion: @escaping CompletionHandler){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    do {
                    let decoderData = try JSONDecoder().decode(NewsData.self, from: safeData)
                    completion(decoderData)
                        } catch {
                            print(error)
                        }
                }
            }
            task.resume()
        }
    }
        
        
    }


