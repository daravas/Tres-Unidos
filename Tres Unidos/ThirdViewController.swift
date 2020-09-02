//
//  ThirdViewController.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 30/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var imageTest: UIImageView!
    @IBOutlet weak var artboardView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  imageTest.image = UIImage(named: "teste.jpg") //exemplo
        
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
    
    @IBAction func addTriangle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
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
        
        let panTriangle = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
               imagem.addGestureRecognizer(panTriangle)
        
        
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
          // 1
          let translation = gesture.translation(in: view)
          
          // 2
          guard let gestureView = gesture.view else {
              return
          }
          
          gestureView.center = CGPoint(
              x: gestureView.center.x + translation.x,
              y: gestureView.center.y + translation.y
          )
          
          // 3
          gesture.setTranslation(.zero, in: view)
      }
    
    @IBAction func addRectangle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
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
    }
    
    @IBAction func addCircle(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 414, height: 539))
        
        let img = renderer.image { ctx in
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
    }
}
