//
//  ArtistViewController.swift
//  Tres Unidos
//
//  Created by Mayara Mendonça de Souza on 02/09/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var artistTextField: UITextField!
    var song:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configuracao do text field
        artistTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: artistTextField.frame.height))
        artistTextField.leftViewMode = .always
        artistTextField.layer.borderWidth = 2
        artistTextField.attributedPlaceholder = NSAttributedString(string: "Escreva o nome do artista aqui", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        //tapGesture para clicar fora do keyboard
        configureTapGesture()
        
        //delegate para o botao de return dar dismiss no keyboard
        self.artistTextField.delegate = self
        
        //text field movimentar de acordo com o keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(ArtistViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ArtistViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        print("esse eh o nome da musica que veio do outro vc")
        print(song)
        
        // Do any additional setup after loading the view.
    }
    
    //tapGesture para dar dismiss no keyboard ao clicar fora dele
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ArtistViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    //botao de return dar dismiss no keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //configuracao do movimento da tela para o keyboard nao cobrir o text field
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            //caso nao tenha nenhum keyboard disponivel
            return
        }
        //move a view pra cima
        self.view.frame.origin.y = 0 - keyboardSize.height + 200
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        //mover para a posicao inicial
        self.view.frame.origin.y = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        //limpar p campo de text field
        self.artistTextField.text = ""
    }
    
    //Passa o nome da música e o nome do artista e o bpm para o próximo view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue", case let nextVC = segue.destination as? SecondViewController {
            nextVC?.songName = self.song!
            nextVC?.artistName = self.artistTextField.text
        }
    }

}
