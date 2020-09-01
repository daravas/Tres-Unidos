//
//  SongAndArtist.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 01/09/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

// MARK: - SongAndArtist
struct SongAndArtist: Codable {
    let search: [Search]
}

// MARK: - Search
struct Search: Codable {
    let songID, songTitle: String
    let songURI: String
    let tempo, timeSig, keyOf, openKey: String
    let artist: Artist
    let album: Album

    enum CodingKeys: String, CodingKey {
        case songID = "song_id"
        case songTitle = "song_title"
        case songURI = "song_uri"
        case tempo
        case timeSig = "time_sig"
        case keyOf = "key_of"
        case openKey = "open_key"
        case artist, album
    }
}

// MARK: - Album
struct Album: Codable {
    let title: String
    let uri, img: String
    let year: String
}

// MARK: - Artist
struct Artist: Codable {
    let id, name: String
    let uri, img: String
    let genres: [String]
    let from, mbid: String
}
