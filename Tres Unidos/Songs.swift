//
//  Songs.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 31/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

// MARK: - SongSearchResult
struct SongSearchResult:Codable{
    var search: [Song]
}

// MARK: - Song
struct Song:Codable {
    var id: String
    var title: String
    var uri: String?
    var artist:Artist
}

// MARK: - SongSearchResult
struct Artist:Codable {
    var id:String
    var name:String
    var uri:String?
    var img:String?
    var genres:[String]?
    var from: String?
    var mbid: String?
}

// MARK: - SongAndArtistResult
struct SongAndArtistResult: Codable {
    var search: [SongAndArtist]
}

// MARK: - SongAndArtist
struct SongAndArtist: Codable {
    let songID, songTitle: String
    let songURI: String
    let tempo, timeSig: String?
    let keyOf: String
    let openKey: String?
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
    let uri, img: String?
    let year: String
}
