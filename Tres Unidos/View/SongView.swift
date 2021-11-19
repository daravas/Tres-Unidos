//
//  SongView.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 28/10/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class SongView: UIView {

    public let instructionLabel: UILabel = {
        let instruction = UILabel()
        instruction.text = "Procure por uma música que representa você hoje"
        instruction.font = UIFont(name: "Raleway-Regular", size: 24)
        instruction.textColor = UIColor(named: "button")
        instruction.numberOfLines = 3
        instruction.textAlignment = .left
        instruction.translatesAutoresizingMaskIntoConstraints = false
        return instruction
    }()
    
    public let songTextField: UITextField = {
       let song = UITextField(frame: CGRect(x: 50, y: 638, width: 314, height: 52))
        song.borderStyle = .line
        song.textColor = UIColor(named: "button")
        song.font = UIFont(name: "Raleway-Regular", size: 15)
        song.backgroundColor = UIColor(named: "background")
        //song.placeholder = "Nome da música"
        song.isEnabled = true
        song.isUserInteractionEnabled = true
        song.translatesAutoresizingMaskIntoConstraints = false
        
        song.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: song.frame.height))
        song.leftViewMode = .always
        song.layer.borderWidth = 2
        song.layer.borderColor = UIColor(named: "button")?.cgColor
        song.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("placeholderSong", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "button")!])
        

        
        return song
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
        self.addSubview(songTextField)
        self.addSubview(avancarButton)
    //    setupConstraints()

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        instructionLabel.frame = CGRect(x: 50, y: 549, width: 314, height: 70)
        songTextField.frame = CGRect(x: 50, y: 638, width: 314, height: 52)
        avancarButton.frame = CGRect(x: 50, y: 730, width: 314, height: 52)
    }
    
    func setupConstraints(){
        // avancarButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        avancarButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
       // avancarButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        avancarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 50).isActive = true

      //  avancarButton.topAnchor.constraint(equalTo: songTextField.bottomAnchor, constant: 40).isActive = true
        avancarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 50).isActive = true
        avancarButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80).isActive = true


//
//        songTextField.heightAnchor.constraint(equalToConstant: 52).isActive = true
//        songTextField.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 32).isActive = true
//        songTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
//     //   songTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
//        songTextField.bottomAnchor.constraint(equalTo: avancarButton.topAnchor, constant: -40).isActive = true
////
//        instructionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
//        instructionLabel.bottomAnchor.constraint(equalTo: songTextField.topAnchor, constant: -32).isActive = true
     //  instructionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
       // instructionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

    }
    

}
