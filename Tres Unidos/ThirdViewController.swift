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
 
    var color = UIColor.black
    var songBpm:Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        gerarCores()

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
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: artboardView.frame.midX-51, y: artboardView.frame.midY-51, width: 51, height: 51)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(5)
            ctx.cgContext.move(to: CGPoint(x: rectangle.minX,y: rectangle.minY))
            ctx.cgContext.addLine(to: CGPoint(x: rectangle.maxX, y: rectangle.midY))
            ctx.cgContext.addLine(to: CGPoint(x: rectangle.minX, y: rectangle.maxY))
            ctx.cgContext.closePath()
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imagem = UIImageView.init(image: img)
        
        artboardView.addSubview(imagem)
        
        imagem.isUserInteractionEnabled = true
        
        //adc gesto de arrastar
        let panTriangle = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imagem.addGestureRecognizer(panTriangle)
        
        //adc redimensionar
        let pinchTriangle = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imagem.addGestureRecognizer(pinchTriangle)
        
        //adc rotacionar
        let rotateTriangle = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imagem.addGestureRecognizer(rotateTriangle)
        
        
    }
    
    
    @IBAction func addRectangle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: artboardView.frame.midX, y: artboardView.frame.midX, width: 51, height: 51)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(5)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        //artboardView.image = img
        let imagem = UIImageView.init(image: img)
        artboardView.addSubview(imagem)
        imagem.isUserInteractionEnabled = true
        
        let panRectangle = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imagem.addGestureRecognizer(panRectangle)
        let pinchRectangle = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imagem.addGestureRecognizer(pinchRectangle)
        
        let rotateRectangle = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imagem.addGestureRecognizer(rotateRectangle)
    }
    
    @IBAction func addCircle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
            //posicao que é inicializado
            let rectangle = CGRect(x: artboardView.frame.midX, y: artboardView.frame.midY, width: 51, height: 51)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(5)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        
        let imagem = UIImageView.init(image: img)
        artboardView.addSubview(imagem)
        imagem.isUserInteractionEnabled = true
        
        let panCircle = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        imagem.addGestureRecognizer(panCircle)
        let pinchCircle = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        imagem.addGestureRecognizer(pinchCircle)
        
        let rotateCircle = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate))
        imagem.addGestureRecognizer(rotateCircle)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
           
           let translation = gesture.translation(in: view)
           
           
           guard let gestureView = gesture.view else {
               return
           }
//           func handlePan(pan: UIPanGestureRecognizer) {
//               switch pan.state {
//               case .Began:
//                   if CGRectContainsPoint(self.pannableView.frame, pan.locationInView(self.pannableView)) {
//                       // Gesture started inside the pannable view. Do your thing.
//                   }
//           }
       
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
