//
//  NewsManager.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 05.09.2024.
//

import Foundation
protocol NewsModelDelegate{
    func newsUpdate(_ newsManager: NewsManager, news: NewsModel)
}
struct NewsManager{
    var delegate : NewsModelDelegate?
    
    let newsApi = "https://newsapi.org/v2/everything?q=Apple&from=2024-08-06&sortBy=popularity&apiKey=e16f87027018476481f2366c3d5eaa5e"
    
    func fetchNews(requestName : String){
        let urlString = "https://newsapi.org/v2/everything?q=\(requestName)&from=2024-08-06&sortBy=popularity&apiKey=e16f87027018476481f2366c3d5eaa5e"
        performRequest(urlString: urlString)
    }
    func performRequest(urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let e = error{
                    print(e)
                    return
                }
                if let safeData = data{
                    if let news = self.parseJSON(safeData){
                        delegate?.newsUpdate(self, news: news)
                    }
                }
                
            }
        }
        
        
    }
    func parseJSON(_ newsData : Data) -> NewsModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData =  try decoder.decode(NewsData.self, from: newsData)
            let author = decodedData.articels[0].author
            let description = decodedData.articels[0].description
            let title = decodedData.articels[0].title
            let news = NewsModel(author: author, title: title, descrpition: description)
            return news
            
        }catch{
            print("Error happend")
        }
        return nil
    }
}

