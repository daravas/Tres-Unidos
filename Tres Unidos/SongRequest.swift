//
//  SongRequest.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 01/09/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation

var songs: [Song] = []
var songsAndArtists : [SongAndArtist] = []
var firstSong : Song!
var songAndArtist : SongAndArtist!
var songBpmString: String = ""
var songBpmInt: Int = 0
var artist: String = ""
var songTitle: String = ""
var albumCover: String = ""

let apiKey = "18f85ada3dd15f657ec71da0ee4773ee"

// MARK: - Acesso a API

//Converter o nome da musica para o formato aceitado pela API
func convertSongName(songName:String) -> String{
    //Substitui espacos por +
    let songNameConverted = songName.replacingOccurrences(of: " ", with: "+")
    return songNameConverted
}

//Acessar a API e buscar pelo nome da musica
@IBAction func searchSong(_ sender: Any) {
    //print (songTextField.text)
    let song = convertSongName(songName: songTextField.text!)
    //print(song)
    
    let stringUrl = "https://api.getsongbpm.com/search/?api_key=\(apiKey)&type=song&lookup=\(song)"
    print (stringUrl)
    
    let url = URL(string: stringUrl)!
    let session = URLSession.shared
    
    let task = session.dataTask(with: url) { data, response, error in
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(SongSearchResult.self, from: data!)
            self.songs = results.search
            
            //A busca de uma musica pode retornar um array de musicas, mas vamos pegar apenas o primeiro resultado caso exista mais de uma musica com o mesmo nome
            self.firstSong = results.search[0]
            DispatchQueue.main.async {
                //print(self.songs)
                self.artist = self.firstSong.artist.name
                self.songTitle = self.firstSong.title
                print(self.artist)
                print(self.songTitle)
                self.searchBpmAndAlbumCover()
            }
        } catch {
            print("Erro: \(error.localizedDescription)")
        }
    }
    task.resume()
    
}

func searchBpmAndAlbumCover(){
    let song = convertSongName(songName: songTextField.text!)
    let artistConverted = convertSongName(songName:self.artist)
    let stringUrl = "https://api.getsongbpm.com/search/?api_key=\(apiKey)&type=both&lookup=song:\(song)artist:\(artistConverted)"
    print (stringUrl)
    
    let url = URL(string: stringUrl)!
    let session = URLSession.shared
    
    let task = session.dataTask(with: url) { data, response, error in
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(SongAndArtistResult.self, from: data!)
            self.songsAndArtists = results.search
            self.songAndArtist = results.search [0]
            DispatchQueue.main.async {
                self.songBpmString = self.songAndArtist.tempo
                //o valor do bpm retornado pelo json é uma string, queremos converter pra int para comparar depois
                self.songBpmInt = Int(self.songBpmString)!
                self.albumCover = self.songAndArtist.album.img!
                print(self.songBpmString)
                print(self.songBpmInt)
                print(self.albumCover)
            }
        } catch {
            print("Erro: \(error.localizedDescription)")
        }
    }
    task.resume()
}
