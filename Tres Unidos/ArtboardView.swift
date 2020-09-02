//
//  ArtboardView.swift
//  Tres Unidos
//
//  Created by Dara Vasconcelos on 31/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import UIKit
import CoreGraphics

@IBDesignable
class ArtboardView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         let path = UIBezierPath(ovalIn: rect)
         UIColor.green.setFill()
         path.fill()
        
    }
    

}
