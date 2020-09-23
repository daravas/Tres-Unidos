//
//  FirstViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 28/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet var songTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configuracao do text field
        songTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: songTextField.frame.height))
        songTextField.leftViewMode = .always
        songTextField.layer.borderWidth = 2
        songTextField.layer.borderColor = UIColor(named: "button")?.cgColor
        songTextField.attributedPlaceholder = NSAttributedString(string: "Escreva o nome da música aqui", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "button")!])
        
        //tapGesture para clicar fora do keyboard
        configureTapGesture()
        
        //delegate para o botao de return dar dismiss no keyboard
        self.songTextField.delegate = self
        
        //text field movimentar de acordo com o keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    //tapGesture para dar dismiss no keyboard ao clicar fora dele
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.handleTap))
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
            nextVC?.song = songTextField.text
        }
    }
    
    //limpar campo de text field
    override func viewWillAppear(_ animated: Bool) {
        self.songTextField.text = ""
    }
    
    // tratamento para campos vazios
    @IBAction func avancarButton() {
        if songTextField.text == "" {
            alerta()
        }
    }
    
    //funcao de alerta
    func alerta() {
        let alerta = UIAlertController(title: "Alerta", message: "Preencha o campo de música.", preferredStyle: UIAlertController.Style.alert)
        let botaoOK = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alerta.addAction(botaoOK)
        self.present(alerta, animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        songTextField.layer.borderColor = UIColor(named: "button")?.cgColor
    }
}
