//
//  CanvasView.swift
//  Tres Unidos
//
//  Created by Dara Caroline on 04/11/21.
//  Copyright © 2021 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    public let canvasView:UIView = {
       let canvas = UIView()
        canvas.contentMode = .scaleToFill
        canvas.backgroundColor = UIColor(named: "background")
        canvas.clipsToBounds = true
        canvas.autoresizesSubviews = true
        canvas.isUserInteractionEnabled = true
        return canvas
    }()
    
    public let songLabel:UILabel = {
        let song = UILabel()
        song.text = "Nome - Artista"
        song.textColor = UIColor(named: "button")
        song.font = UIFont(name: "Raleway-Bold", size: 22)
        song.textAlignment = .center
        return song
    }()
    
    public let colorLabel:UILabel = {
        let color = UILabel()
        color.text = "Selecione a cor"
        color.textColor = UIColor(named: "button")
        color.font = UIFont(name: "Raleway", size: 16)
        return color
    }()
    
    public let shapesLabel:UILabel = {
        let shapes = UILabel()
        shapes.text = "Adicionar formas/imagens"
        shapes.textColor = UIColor(named: "button")
        shapes.font = UIFont(name: "Raleway", size: 16)
        return shapes
    }()
    
    public let triangleButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "triangulo"), for: .normal)
        return btn
    }()
    
    public let squareButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "retangulo"), for: .normal)
        return btn
    }()
    
    public let plusButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "plus"), for: .normal)
        return btn
    }()
    
    public let circleButton:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "circulo"), for: .normal)
        return btn
    }()
    
    public let exportButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 755, width: 314, height: 52))
        btn.setTitle("Exportar", for: .normal)
        btn.setTitleColor(UIColor(named: "background"), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway-Bold", size: 24)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = UIColor(named: "button")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let tryAgainButton:UIButton = {
        let btn = UIButton()
        btn.setTitle("Tentar com uma nova música", for: .normal)
        btn.setTitleColor(UIColor(named: "button"), for: .normal)
        btn.titleLabel?.font = UIFont(name: "Raleway", size: 16)
        btn.backgroundColor = UIColor(named: "background")
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let colorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .link
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let secondColorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemOrange
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let thirdColorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let fourthColorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemIndigo
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let fifthColorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemRed
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let sixthColorButton:UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemYellow
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView(arrangedSubviews: [self.colorButton, self.secondColorButton, self.thirdColorButton, self.fourthColorButton, self.fifthColorButton, self.sixthColorButton])
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(canvasView)
        self.addSubview(songLabel)
        self.addSubview(colorLabel)
        self.addSubview(stackView)
        self.addSubview(shapesLabel)
        self.addSubview(triangleButton)
        self.addSubview(squareButton)
        self.addSubview(circleButton)
        self.addSubview(plusButton)
        self.addSubview(exportButton)
        self.addSubview(tryAgainButton)


        
      //  setupConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        canvasView.frame = CGRect(x: 0, y: 0, width: 414, height: 539)
        songLabel.frame = CGRect(x: 50, y: 547, width: 314, height: 26)
        colorLabel.frame = CGRect(x: 50, y: 601, width: 314, height: 19)
        stackView.frame = CGRect(x: 0, y: 629, width: 414, height: 30)
        shapesLabel.frame = CGRect(x: 50, y: 683, width: 314, height: 19)

        triangleButton.frame = CGRect(x: 50, y: 710, width: 41, height: 41)
        squareButton.frame = CGRect(x: 99, y: 710, width: 41, height: 41)
        circleButton.frame = CGRect(x: 148, y: 710, width: 41, height: 41)
        plusButton.frame = CGRect(x: 197, y: 710, width: 41, height: 41)
        
     //  exportButton.frame = CGRect(x: 0, y: 755, width: 314, height: 52)
        tryAgainButton.frame = CGRect(x: 98.5, y: 835, width: 217, height: 31)

    }
    

}
