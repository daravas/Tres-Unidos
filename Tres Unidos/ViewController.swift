//
//  ViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var coordinator: AppCoordinator?
    

    let firstView = FirstView()
    let songView = SongView()
    let artistView = ArtistView()
    let confirmationView = ConfirmationView()
    let canvasView = CanvasView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(firstView)
        setupNextButton()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstView.frame = view.bounds
    }
    
    func setupNextButton(){
        firstView.avancarButton.addTarget(self, action: #selector(avancar), for: .touchUpInside)
    }
 
    @objc func avancar(){
        coordinator?.showSongVc()
    }
//    //botao inicial de avancar
//    @IBAction func avancarPrimarioButton() {
//        let vc = storyboard?.instantiateViewController(identifier: "navigation_vc")
//        vc!.modalPresentationStyle = .fullScreen
//        present(vc!, animated: true)
//    }

}

