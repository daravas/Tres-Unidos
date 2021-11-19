//
//  ThirdViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 30/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var cr1: UIButton!
    @IBOutlet weak var cr2: UIButton!
    @IBOutlet weak var cr3: UIButton!
    @IBOutlet weak var cr4: UIButton!
    @IBOutlet weak var cr5: UIButton!
    @IBOutlet weak var cr6: UIButton!
    @IBOutlet weak var artboardView: UIView!
    @IBOutlet weak var songLabel: UILabel!
    
    var color:UIColor = UIColor.black
    var songBpm:Int = 0
    //var capaDaMusica:UIImage
    var songName:String = ""
    var artistName:String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        songLabel.text = "\(songName) - \(artistName)"
        gerarCores()
        
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //botao de recomecar
    @IBAction func recomecar() {
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    //retirando a navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //selecionando uma cor da paleta de cores
    @IBAction func selecionarCor(_ sender: UIButton) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 1:
            color = cr1.backgroundColor!
            print(color)
        case 2:
            color = cr2.backgroundColor!
            print(color)
        case 3:
            color = cr3.backgroundColor!
            print(color)
        case 4:
            color = cr4.backgroundColor!
            print(color)
        case 5:
            color = cr5.backgroundColor!
            print(color)
        case 6:
            color = cr6.backgroundColor!
            print(color)
        default:
            return
        }
        
    }
    
    //funcao para selecionar a paleta de cores
    func gerarCores() {
        if songBpm >= 40 && songBpm < 60 {
            //paleta 1
            cores(cores: CoresDados.paleta1)
        } else if songBpm >= 60 && songBpm < 66 {
            //paleta 2
            cores(cores: CoresDados.paleta2)
        } else if songBpm >= 66 && songBpm < 76 {
            //paleta 3
            cores(cores: CoresDados.paleta3)
        } else if songBpm >= 76 && songBpm < 108 {
            //paleta 4
            cores(cores: CoresDados.paleta4)
        } else if songBpm >= 108 && songBpm < 120 {
            //paleta 5
            cores(cores: CoresDados.paleta5)
        } else if songBpm >= 120 && songBpm < 168 {
            //paleta 6
            cores(cores: CoresDados.paleta6)
        } else if songBpm >= 168 && songBpm < 200 {
            //paleta 7
            cores(cores: CoresDados.paleta7)
        } else {
            //paleta 8
            cores(cores: CoresDados.paleta8)
        }
    }
    func cores(cores: Cores) {
        cr1.backgroundColor = cores.cor1
        cr2.backgroundColor = cores.cor2
        cr3.backgroundColor = cores.cor3
        cr4.backgroundColor = cores.cor4
        cr5.backgroundColor = cores.cor5
        cr6.backgroundColor = cores.cor6
    }
    
    //botao de exportar
    @IBAction func exportarButton() {
        let image = artboardView.asImage()
        let activity = UIActivityViewController(activityItems: [image],
                                                applicationActivities: nil)
        //activity.popoverPresentationController?.sourceView = self.view
        present(activity, animated: true)
    }
    
    
    @IBAction func addTriangle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: 0, y: 0, width: 100, height: 100)
            
            ctx.cgContext.setFillColor(color.cgColor)
            //ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(0)
            ctx.cgContext.move(to: CGPoint(x: rectangle.minX,y: rectangle.minY))
            ctx.cgContext.addLine(to: CGPoint(x: rectangle.maxX, y: rectangle.midY))
            ctx.cgContext.addLine(to: CGPoint(x: rectangle.minX, y: rectangle.maxY))
            ctx.cgContext.closePath()
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imagem = UIImageView.init(image: img)
        imagem.frame.origin = CGPoint(x: artboardView.frame.midX-50, y: artboardView.frame.midY-50)
        artboardView.addSubview(imagem)
        imagem.isUserInteractionEnabled = true
        
        chamadaGesture(imagem: imagem)

    }
    
    
    @IBAction func addRectangle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: 0, y: 0, width: 100, height: 100)

            ctx.cgContext.setFillColor(color.cgColor)
            //ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(0)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        //artboardView.image = img
        let imagem = UIImageView.init(image: img)
        imagem.frame.origin = CGPoint(x: artboardView.frame.midX-50, y: artboardView.frame.midY-50)
        artboardView.addSubview(imagem)
        imagem.isUserInteractionEnabled = true
        
        chamadaGesture(imagem: imagem)

    }
    
    @IBAction func addCircle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: 0, y: 0, width: 100, height: 100)
            
            ctx.cgContext.setFillColor(color.cgColor)
            //ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(0)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imagem = UIImageView.init(image: img)
        imagem.frame.origin = CGPoint(x: artboardView.frame.midX-50, y: artboardView.frame.midY-50)
        artboardView.addSubview(imagem)
        imagem.isUserInteractionEnabled = true
        
        chamadaGesture(imagem: imagem)

    }
    
    var imagemAdd:UIImageView = UIImageView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
    var imagePicker = UIImagePickerController()
    @IBAction func addImage() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        artboardView.addSubview(imagemAdd)
        imagemAdd.isUserInteractionEnabled = true
        
        chamadaGesture(imagem: imagemAdd)

    }
    
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
           
           let translation = gesture.translation(in: view)
           guard let gestureView = gesture.view else {
               return
           }
           gestureView.center = CGPoint(
               x: gestureView.center.x + translation.x,
               y: gestureView.center.y + translation.y
           )
           gesture.setTranslation(.zero, in: view)
       }
       
       @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
           guard let gestureView = gesture.view else {
               return
           }
           gestureView.transform = gestureView.transform.scaledBy(
               x: gesture.scale,
               y: gesture.scale
           )
           gesture.scale = 1
       }
       
       @objc func handleRotate(_ gesture: UIRotationGestureRecognizer) {
           guard let gestureView = gesture.view else {
               return
           }
           gestureView.transform = gestureView.transform.rotated(
               by: gesture.rotation
           )
           gesture.rotation = 0
       }
    
    
      @objc func tap(sender: UITapGestureRecognizer) {
        
          artboardView.bringSubviewToFront(sender.view!)

      }
    
    func chamadaGesture(imagem: UIImageView){
        //adc gesto de arrastar
        let panTriangle = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imagem.addGestureRecognizer(panTriangle)
        
        //adc redimensionar
        let pinchTriangle = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imagem.addGestureRecognizer(pinchTriangle)
        
        //adc rotacionar
        let rotateTriangle = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imagem.addGestureRecognizer(rotateTriangle)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
        imagem.addGestureRecognizer(tapRecognizer)
    }

}

// para converter UIView em UIImage
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension ThirdViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imagemAdd.image = image
        }
        //chamada para caso adicione outra foto
        imagemAdd = UIImageView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        dismiss(animated: true, completion: nil)
    }
}
