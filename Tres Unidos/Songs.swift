//
//  Songs.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 31/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

struct SearchResult:Codable{
    var search: [Song]
}

struct Song:Codable {
    var id: String
    var title: String
    var uri: String?
    var artist:Artist
}

struct Artist:Codable {
    var id:String
    var name:String
    var uri:String?
    var img:String?
    var genres:[String]?
    var from: String?
    var mbid: String?
}
