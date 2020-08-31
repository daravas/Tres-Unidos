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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //adicionando borda a imagem
        capaDaMusica.image = UIImage(named: "duda.jpg") //exemplo
        capaDaMusica.layer.borderWidth = 5
        capaDaMusica.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
