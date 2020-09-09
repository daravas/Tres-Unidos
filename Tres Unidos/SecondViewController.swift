//
//  SecondViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var capaDaMusica: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel?
    @IBOutlet weak var artistNameLabel: UILabel?
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var botao: UIButton!
    var tentarNovamente: UIButton = UIButton(frame: CGRect(x: 50, y: 731, width: 314, height: 52))
    
    var artistName:String?
    var songName:String = "oi"
    var albumCoverLink:String = "oi"
    var songBpm:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //botao tentar novamente
        tentarNovamente.addTarget(self, action: #selector(SecondViewController.tentar), for: .touchUpInside)
        tentarNovamente.backgroundColor = .black
        tentarNovamente.setTitleColor(.white, for: .normal)
        tentarNovamente.setTitle("Tentar Novamente", for: .normal)
        tentarNovamente.titleLabel?.font = UIFont(name: "Raleway", size: 20)
        tentarNovamente.isHidden = true
        self.view.addSubview(self.tentarNovamente)
        
        //tela de loading
        loading()
        
        //AutoLayout loading
//        teste.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        teste.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.texto.isHidden = false
        self.botao.isHidden = false
        self.tentarNovamente.isHidden = true
        
        //chamando a busca
        searchInfoAboutMusic()
        //delay para atualizar a tela
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            //atualizacao dos dados da tela
            self.songNameLabel!.text = self.songTitle
            self.artistNameLabel!.text = self.artist
            guard let imageUrl:URL = URL(string: self.albumCover) else {
                // se nao tem imagem entao nao tem a musica?
                //colocando aqui  pra ve se desaparece o erro roxo que tinha quando eu tava usando essa linha abaixo no "catch"
                self.dismissLoading()
                self.texto.isHidden = true
                self.botao.isHidden = true
                self.tentarNovamente.isHidden = false
                return
            }
            self.capaDaMusica.load(url: imageUrl)
            self.capaDaMusica.layer.borderWidth = 5
            self.capaDaMusica.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            self.dismissLoading()
        }
        print("oi")
        
    }
    
    //Passa o bpm para o próximo view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArtSegue", case let nextVC = segue.destination as? ThirdViewController {
            nextVC?.songBpm = self.songBpmInt!
            nextVC?.songName = self.songTitle
            nextVC?.artistName = self.artist
        }
    }
    
    //view de loading
    let teste: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
    func loading() {
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 75, y: 425, width: 50, height: 50))
        let textinho: UILabel = UILabel(frame: CGRect(x: 135, y: 433, width: 253, height: 31))
        teste.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        textinho.text = "Só um momentinho :)"
        textinho.font = UIFont(name: "Raleway", size: 20)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating();
        teste.addSubview(textinho)
        teste.addSubview(loadingIndicator)
                
        self.view.addSubview(teste)
        teste.center = self.view.center

        
    }
    
    //funcao de dismiss com animacao da tela de loading
    func dismissLoading() {
        UIView.animate(withDuration: 0.2, delay: 1, options: .curveEaseInOut, animations: {
            self.teste.alpha = 0
        }) { _ in
            self.teste.isHidden = true
        }
    }
    
    //funcao de tentar novamente em caso de algum erro
    @IBAction func tentar() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    //codigo ajustado
    var songs: [Song] = []
    var songsAndArtists : [SongAndArtist] = []
    var firstSong : Song!
    var songAndArtist : SongAndArtist!
    var songBpmString: String?
    var songBpmInt: Int?
    var artist: String = "Tente novamente!"
    var songTitle: String = "Poxa, nada encontrado"
    var albumCover: String = ""
    
    let apiKey = "18f85ada3dd15f657ec71da0ee4773ee"
    
    // MARK: - Acesso a API
    
    //Converter o nome da musica para o formato aceitado pela API
    func convertSongName(songName:String) -> String{
        //Substitui espacos por +
        let songNameConverted = songName.replacingOccurrences(of: " ", with: "+")
        return songNameConverted
    }
    
    
    func searchInfoAboutMusic() {
        //let songConverted = convertSongName(songName: songName)
        //let artistConverted = convertSongName(songName:self.artistName!)
        
        let songConverted = songName.stringByAddingPercentEncodingForFormData(plusForSpace: true)
        let artistConverted = artistName!.stringByAddingPercentEncodingForFormData(plusForSpace: true)
        
        
        
        
        let stringUrl = "https://api.getsongbpm.com/search/?api_key=\(apiKey)&type=both&lookup=song:\(songConverted!)artist:\(artistConverted!)"
        print (stringUrl)
        
        let url = URL(string: stringUrl)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SongAndArtistResult.self, from: data!)
                self.songsAndArtists = results.search
                self.songAndArtist = results.search[0]
                DispatchQueue.main.async {
                    self.artist = self.songAndArtist.artist.name
                    self.songTitle = self.songAndArtist.songTitle
                    //se o valor do bpm for null, salvar com o valor 0 para não quebrar a próxima tela
                    self.songBpmString = self.songAndArtist.tempo ?? "0"
                    //o valor do bpm retornado pelo json é uma string, queremos converter pra int para comparar depois
                    self.songBpmInt = Int(self.songBpmString!)
                    self.albumCover = self.songAndArtist.album.img!
                    print(self.songTitle)
                    print(self.artist)
                    print(self.songBpmString!)
                    print(self.songBpmInt!)
                    print(self.albumCover)
                }
            } catch {
                print("Erro: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension String {
    func stringByAddingPercentEncodingForRFC3986() -> String? {
        let unreserved = "-._~/?"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
    }
    
    public func stringByAddingPercentEncodingForFormData(plusForSpace: Bool=false) -> String? {
        let unreserved = "*-._çã"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        
        if plusForSpace {
            allowed.addCharacters(in: " ")
        }
        
        var encoded = addingPercentEncoding(withAllowedCharacters: allowed as CharacterSet)
        if plusForSpace {
            encoded = encoded?.replacingOccurrences(of: " ", with: "+")
        }
        return encoded
    }
}


