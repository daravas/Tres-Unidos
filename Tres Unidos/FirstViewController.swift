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
    
    var searchResult: [Search] = []
    var songBpm: Int = 0
    var artist: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configuracao do text field
        songTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: songTextField.frame.height))
        songTextField.leftViewMode = .always
        songTextField.layer.borderWidth = 2
        songTextField.attributedPlaceholder = NSAttributedString(string: "Escreva o nome da música aqui", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
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
    
    // MARK: - Acesso a API
    
    //Converter o nome da musica para o formato aceitado pela API
    func convertSongName(songName:String) -> String{
        //Substitui espacos por +
        let songNameConverted = songName.replacingOccurrences(of: " ", with: "+")
        return songNameConverted
    }
    
    //Acessar a API e buscar pelo nome da musica
    @IBAction func searchSong(_ sender: Any) {
        let song = convertSongName(songName: songTextField.text!)
        
        let apiKey = "18f85ada3dd15f657ec71da0ee4773ee"
        
        let stringUrl = "https://api.getsongbpm.com/search/?api_key=\(apiKey)&type=song&lookup=\(song)"
    
        let url = URL(string:stringUrl)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
                   do {
                       let decoder = JSONDecoder()
                       let results = try decoder.decode([Search].self, from: data!)
                    self.searchResult = results
                       DispatchQueue.main.async {
                        //cell.textLabel?.text = films[indexPath.row].title
                       }
                   } catch {
                       print("Erro: \(error.localizedDescription)")
                   }
               }
               task.resume()
               
        
        
    }
    
    
}
