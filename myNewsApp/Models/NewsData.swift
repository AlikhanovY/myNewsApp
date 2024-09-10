//
//  NewsData.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 05.09.2024.
//

import Foundation
struct NewsData: Decodable {
    let articels : [Articles]
}
struct Articles : Decodable{
    let author : String
    let title : String
    let description : String
    
}
