//
//  ConfirmationView.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 04/11/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ConfirmationView: UIView {

    public let songCover: UIImageView = {
       let cover = UIImageView()
        cover.image = UIImage(named: "erro1")
        cover.contentMode = .scaleAspectFit
        return cover
    }()
    
    public let songNameLabel:UILabel = {
       let song = UILabel()
        song.text = "Poxa, nada encontrado"
        song.textColor = UIColor(named: "button")
        song.font = UIFont(name: "Raleway-Bold", size: 26)
        return song
    }()
    
    public let artistNameLabel:UILabel = {
       let artist = UILabel()
        artist.text = "Tente novamente!"
        artist.textColor = UIColor(named: "button")
        artist.font = UIFont(name: "Raleway-Medium", size: 20)
        return artist
    }()
    
    public let instructionLabel:UILabel = {
       let instruction = UILabel()
        instruction.text = "É essa música que você está procurando?"
        instruction.numberOfLines = 2
        instruction.textColor = UIColor(named: "button")
        instruction.font = UIFont(name: "Raleway", size: 20)
        return instruction
    }()
    
    public let avancarButton:UIButton = {
        let avancar = UIButton()
         avancar.setTitle("Avançar", for: .normal)
         avancar.setTitleColor(UIColor(named: "background"), for: .normal)
         avancar.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 24)
         avancar.titleLabel?.textAlignment = .center
         avancar.backgroundColor = UIColor(named: "button")
         avancar.translatesAutoresizingMaskIntoConstraints = false
         return avancar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(songCover)
        self.addSubview(songNameLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(instructionLabel)
        self.addSubview(avancarButton)
        
      //  setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        songCover.frame = CGRect(x: 50, y: 206.5, width: 314, height: 314)
        songNameLabel.frame = CGRect(x: 64.5, y: 530.5, width: 285.5, height: 31)
        artistNameLabel.frame = CGRect(x: 123, y: 563.5, width: 168.5, height: 23.5)
        instructionLabel.frame = CGRect(x: 50, y: 667, width: 314, height: 47)
        avancarButton.frame = CGRect(x: 50, y: 730, width: 314, height: 52)
    }
}
