//
//  Songs.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 31/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

// MARK: - Search
struct Search: Codable {
    let search: [Songs]
}

// MARK: - Songs
struct Songs: Codable {
    let id, title: String
    let uri: String
    let artist: Artist
}

// MARK: - Artist
struct Artist: Codable {
    let id, name: String
    let uri, img: String
    let genres: [String]
    let from, mbid: String
}

typealias SearchResults = [Search]
