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
    
    var artistName:String?
    var songName:String = "oi"
    var albumCoverLink:String = "oi"
    var songBpm:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adicionando borda a imagem
        guard let imageUrl:URL = URL(string: albumCoverLink) else {
            return
        }
        capaDaMusica.load(url: imageUrl)
        capaDaMusica.layer.borderWidth = 5
        capaDaMusica.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Do any additional setup after loading the view.
        songNameLabel!.text = songName
        artistNameLabel!.text = artistName
        print("cheguei no view controller do album")
        print("result \(artistName)")
        print("result \(songName)")
        print("result \(songBpm)")
        print("result \(albumCoverLink)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        songNameLabel!.text = songName
        artistNameLabel!.text = artistName
        print("oi")
    }
    
    //Passa o bpm para o próximo view controller
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ArtSegue", case let nextVC = segue.destination as? ThirdViewController {
            nextVC?.songBpm = self.songBpm
         }
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
