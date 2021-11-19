//
//  ArtistView.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 04/11/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ArtistView: UIView {

   
    public let instructionLabel: UILabel = {
        let instruction = UILabel()
        instruction.text = "Quem canta a música?"
        instruction.font = UIFont(name: "Raleway-Regular", size: 24)
        instruction.textColor = UIColor(named: "button")
        instruction.numberOfLines = 3
        instruction.textAlignment = .left
        instruction.translatesAutoresizingMaskIntoConstraints = false
        return instruction
    }()
    
    public let artistTextField: UITextField = {
       let artist = UITextField()
        artist.borderStyle = .line
        artist.textColor = UIColor(named: "button")
        artist.font = UIFont(name: "Raleway-Regular", size: 15)
        artist.backgroundColor = UIColor(named: "background")
        artist.isEnabled = true
        artist.isUserInteractionEnabled = true
        artist.translatesAutoresizingMaskIntoConstraints = false
        artist.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: artist.frame.height))
        artist.leftViewMode = .always
        artist.layer.borderWidth = 2
        artist.layer.borderColor = UIColor(named: "button")?.cgColor
        artist.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("placeholderArtist", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "button")!])
        
        return artist
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
        
        self.addSubview(instructionLabel)
        self.addSubview(artistTextField)
        self.addSubview(avancarButton)
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        instructionLabel.frame = CGRect(x: 50, y: 549, width: 314, height: 70)
        artistTextField.frame = CGRect(x: 50, y: 638, width: 314, height: 52)
        avancarButton.frame = CGRect(x: 50, y: 730, width: 314, height: 52)
    }
    
    func setupConstraints(){
        
    }
    

}
