//
//  FirstView.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 27/10/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class FirstView: UIView {

    public let greetingLabel:UILabel = {
        let greeting = UILabel()
        greeting.text = "Transforme música em arte"
        greeting.font = UIFont(name: "Raleway-Bold", size: 40)
        greeting.textColor = UIColor(named: "button")
        greeting.textAlignment = .left
        greeting.numberOfLines = 3
        greeting.translatesAutoresizingMaskIntoConstraints = false
        return greeting
    }()
    
    public let avancarButton:UIButton = {
       let avancar = UIButton()
        avancar.setTitle("Avançar", for: .normal)
        avancar.setTitleColor(UIColor(named: "background"), for: .normal)
       // avancar.titleLabel?.textColor = UIColor(named: "background")
        avancar.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 24)
        avancar.titleLabel?.textAlignment = .center
        avancar.backgroundColor = UIColor(named: "button")
        avancar.translatesAutoresizingMaskIntoConstraints = false
        return avancar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(greetingLabel)
        self.addSubview(avancarButton)
        
        setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        greetingLabel.frame = CGRect(x: 50, y: 612, width: 314, height: 94)
        avancarButton.frame = CGRect(x: 50, y: 730, width: 314, height: 52)
    }
    
    func setupConstraints(){
     
        greetingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        greetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        greetingLabel.bottomAnchor.constraint(equalTo: avancarButton.topAnchor, constant: -52).isActive = true
        
        avancarButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        avancarButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        avancarButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80).isActive = true
        avancarButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        avancarButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        

    }
    
}
