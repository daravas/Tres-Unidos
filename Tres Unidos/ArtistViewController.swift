//
//  ArtistViewController.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 02/09/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var artistTextField: UITextField!
    var song:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configuracao do text field
        artistTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: artistTextField.frame.height))
        artistTextField.leftViewMode = .always
        artistTextField.layer.borderWidth = 2
        artistTextField.attributedPlaceholder = NSAttributedString(string: "Escreva o nome do artista aqui", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        //tapGesture para clicar fora do keyboard
        configureTapGesture()
        
        //delegate para o botao de return dar dismiss no keyboard
        self.artistTextField.delegate = self
        
        //text field movimentar de acordo com o keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(ArtistViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArtistViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        print("esse eh o nome da musica que veio do outro vc")
        print(song)
        
        // Do any additional setup after loading the view.
    }
    
    //tapGesture para dar dismiss no keyboard ao clicar fora dele
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ArtistViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    //botao de return dar dismiss no keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //configuracao do movimento da tela para o keyboard nao cobrir o text field
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            //caso nao tenha nenhum keyboard disponivel
            return
        }
        //move a view pra cima
        self.view.frame.origin.y = 0 - keyboardSize.height + 200
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        //mover para a posicao inicial
        self.view.frame.origin.y = 0
    }
    
    
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
    
    
    @IBAction func searchInfoAboutMusic(_ sender: Any) {
        let songConverted = convertSongName(songName: song!)
        let artistConverted = convertSongName(songName:self.artistTextField.text!)
        let stringUrl = "https://api.getsongbpm.com/search/?api_key=\(apiKey)&type=both&lookup=song:\(songConverted)artist:\(artistConverted)"
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
                    self.artist = self.songAndArtist.artist.name
                    self.songTitle = self.songAndArtist.songTitle
                    self.songBpmString = self.songAndArtist.tempo
                    //o valor do bpm retornado pelo json é uma string, queremos converter pra int para comparar depois
                    self.songBpmInt = Int(self.songBpmString)!
                    self.albumCover = self.songAndArtist.album.img!
                    print(self.songTitle)
                    print(self.artist)
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
    
    //Passa o nome da música e o nome do artista e o bpm para o próximo view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue", case let nextVC = segue.destination as? SecondViewController {
            nextVC?.songName = self.songTitle
            nextVC?.artistName = self.artist
            nextVC?.songBpm = self.songBpmInt
            nextVC?.albumCoverLink = self.albumCover
            

        }
    }
}
