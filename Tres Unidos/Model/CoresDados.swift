//
//  CoresDados.swift
//  Tres Unidos
//
//  Created by Evaldo Garcia de Souza Júnior on 31/08/20.
//  Copyright © 2020 Evaldo Garcia de Souza Júnior. All rights reserved.
//

import Foundation
import UIKit


public class CoresDados {
    
    //paleta 40-60 bpm very slow
    public static let paleta1 = Cores(color1: #colorLiteral(red: 0.9529411765, green: 0.9411764706, blue: 0.9490196078, alpha: 1), color2: #colorLiteral(red: 0.968627451, green: 0.9137254902, blue: 0.8941176471, alpha: 1), color3: #colorLiteral(red: 0.9843137255, green: 0.7254901961, blue: 0.6705882353, alpha: 1), color4: #colorLiteral(red: 0.7294117647, green: 0.8196078431, blue: 0.9019607843, alpha: 1), color5: #colorLiteral(red: 0.831372549, green: 0.8941176471, blue: 0.9490196078, alpha: 1), color6: #colorLiteral(red: 0.9058823529, green: 0.9294117647, blue: 0.968627451, alpha: 1))
    
    //paleta 60-66 bpm less slow
    public static let paleta2 = Cores(color1: #colorLiteral(red: 0.8980392157, green: 0.9294117647, blue: 0.9176470588, alpha: 1), color2: #colorLiteral(red: 0.8156862745, green: 0.831372549, blue: 0.8039215686, alpha: 1), color3: #colorLiteral(red: 0.5215686275, green: 0.6549019608, blue: 0.662745098, alpha: 1), color4: #colorLiteral(red: 0.6, green: 0.7568627451, blue: 0.7450980392, alpha: 1), color5: #colorLiteral(red: 0.7333333333, green: 0.8823529412, blue: 0.8705882353, alpha: 1), color6: #colorLiteral(red: 0.8549019608, green: 0.937254902, blue: 0.9137254902, alpha: 1))
    
    //paleta 66-76 bpm moderately slow
    public static let paleta3 = Cores(color1: #colorLiteral(red: 0.6039215686, green: 0.7254901961, blue: 0.6941176471, alpha: 1), color2: #colorLiteral(red: 0.2745098039, green: 0.3647058824, blue: 0.3215686275, alpha: 1), color3: #colorLiteral(red: 0.4941176471, green: 0.6352941176, blue: 0.5215686275, alpha: 1), color4: #colorLiteral(red: 0.6941176471, green: 0.8196078431, blue: 0.6509803922, alpha: 1), color5: #colorLiteral(red: 0.8235294118, green: 0.8980392157, blue: 0.7490196078, alpha: 1), color6: #colorLiteral(red: 0.8509803922, green: 0.9294117647, blue: 0.8705882353, alpha: 1))
    
    //paleta 76-108 bpm walking speed
    public static let paleta4 = Cores(color1: #colorLiteral(red: 0.7490196078, green: 0.9294117647, blue: 0.8588235294, alpha: 1), color2: #colorLiteral(red: 0.4039215686, green: 0.6901960784, blue: 0.6117647059, alpha: 1), color3: #colorLiteral(red: 0.2745098039, green: 0.5294117647, blue: 0.6196078431, alpha: 1), color4: #colorLiteral(red: 0.4078431373, green: 0.7607843137, blue: 0.7921568627, alpha: 1), color5: #colorLiteral(red: 0.5568627451, green: 0.9019607843, blue: 0.8980392157, alpha: 1), color6: #colorLiteral(red: 0.7529411765, green: 0.9529411765, blue: 0.9215686275, alpha: 1))
    
    //paleta 108-120 bpm moderate
    public static let paleta5 = Cores(color1: #colorLiteral(red: 0.8549019608, green: 0.7607843137, blue: 0.8823529412, alpha: 1), color2: #colorLiteral(red: 0.4901960784, green: 0.3882352941, blue: 0.5803921569, alpha: 1), color3: #colorLiteral(red: 0.2274509804, green: 0.1725490196, blue: 0.2549019608, alpha: 1), color4: #colorLiteral(red: 0.4941176471, green: 0.3450980392, blue: 0.5058823529, alpha: 1), color5: #colorLiteral(red: 0.7921568627, green: 0.6196078431, blue: 0.7215686275, alpha: 1), color6: #colorLiteral(red: 0.8941176471, green: 0.8039215686, blue: 0.831372549, alpha: 1))
    
    //paleta 120-168 bpm fast
    public static let paleta6 = Cores(color1: #colorLiteral(red: 0.7960784314, green: 0.8509803922, blue: 0.9098039216, alpha: 1), color2: #colorLiteral(red: 0.5843137255, green: 0.6470588235, blue: 0.768627451, alpha: 1), color3: #colorLiteral(red: 0.568627451, green: 0.4039215686, blue: 0.4901960784, alpha: 1), color4: #colorLiteral(red: 0.9058823529, green: 0.3647058824, blue: 0.431372549, alpha: 1), color5: #colorLiteral(red: 0.9843137255, green: 0.6235294118, blue: 0.5843137255, alpha: 1), color6: #colorLiteral(red: 0.9921568627, green: 0.8549019608, blue: 0.7058823529, alpha: 1))
    
    //paleta 168-200 bpm faster
    public static let paleta7 = Cores(color1: #colorLiteral(red: 0.6862745098, green: 0.7411764706, blue: 0.7215686275, alpha: 1), color2: #colorLiteral(red: 0.3294117647, green: 0.5098039216, blue: 0.4745098039, alpha: 1), color3: #colorLiteral(red: 0.2156862745, green: 0.1803921569, blue: 0.1803921569, alpha: 1), color4: #colorLiteral(red: 0.8156862745, green: 0.3058823529, blue: 0.262745098, alpha: 1), color5: #colorLiteral(red: 0.9215686275, green: 0.6509803922, blue: 0.5411764706, alpha: 1), color6: #colorLiteral(red: 0.9490196078, green: 0.8078431373, blue: 0.6666666667, alpha: 1))
    
    //paleta 200+ bpm even faster
    public static let paleta8 = Cores(color1: #colorLiteral(red: 0.3294117647, green: 0.2196078431, blue: 0.2196078431, alpha: 1), color2: #colorLiteral(red: 0.5215686275, green: 0.2470588235, blue: 0.2549019608, alpha: 1), color3: #colorLiteral(red: 0.7411764706, green: 0.3450980392, blue: 0.3647058824, alpha: 1), color4: #colorLiteral(red: 0.8705882353, green: 0.5333333333, blue: 0.568627451, alpha: 1), color5: #colorLiteral(red: 0.9529411765, green: 0.7058823529, blue: 0.6431372549, alpha: 1), color6: #colorLiteral(red: 0.9725490196, green: 0.8431372549, blue: 0.6705882353, alpha: 1))
    
    private init() {
        
    }
}
