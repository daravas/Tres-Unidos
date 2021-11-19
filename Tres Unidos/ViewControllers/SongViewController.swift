//
//  FirstViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UITextFieldDelegate{
   // @IBOutlet var songTextField: UITextField!
    var songView = SongView()
    weak var coordinator: AppCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        view.addSubview(songView)
        
        //tapGesture para clicar fora do keyboard
        configureTapGesture()
        
        //delegate para o botao de return dar dismiss no keyboard
        songView.songTextField.delegate = self
        configureTextFieldWithKeyboard()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        songView.frame = view.bounds
    }
    
    private func configureTextFieldWithKeyboard(){
        //text field movimentar de acordo com o keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(SongViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SongViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //tapGesture para dar dismiss no keyboard ao clicar fora dele
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SongViewController.handleTap))
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
    
    //Passa o nome da música para o próximo view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ArtistSegue", case let nextVC = segue.destination as? ArtistViewController {
            nextVC?.song = songView.songTextField.text
        }
    }
    
    //limpar campo de text field
    override func viewWillAppear(_ animated: Bool) {
        songView.songTextField.text = ""
    }
    
    // tratamento para campos vazios
    @IBAction func avancarButton() {
        if songView.songTextField.text == "" {
            alerta()
        }
    }
    
    //funcao de alerta
    func alerta() {
        let alerta = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: NSLocalizedString("alertSong", comment: ""), preferredStyle: UIAlertController.Style.alert)
        let botaoOK = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(botaoOK)
        self.present(alerta, animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        songView.songTextField.layer.borderColor = UIColor(named: "button")?.cgColor
    }
}
