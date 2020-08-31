//
//  ViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //botao inicial de avancar
    @IBAction func avancarPrimarioButton() {
        let vc = storyboard?.instantiateViewController(identifier: "navigation_vc")
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true)
    }

}

