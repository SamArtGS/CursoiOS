//
//  ViewController.swift
//  Colores
//
//  Created by Samuel Arturo Garrido Sánchez on 6/12/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ColorAMostrar: UIView!
    
    @IBOutlet var Des1: UISlider! //Rojo
    @IBOutlet var Des2: UISlider! //Azul
    @IBOutlet var Des3: UISlider! //Verde
    
    
    @IBAction func rojo(_ sender: Any) {
        ColorAMostrar.backgroundColor = UIColor(red: CGFloat(Des1.value), green: CGFloat(Des2.value), blue: CGFloat(Des3.value), alpha: 1.0)
    }
    
    @IBAction func Azul(_ sender: Any) {
        ColorAMostrar.backgroundColor = UIColor(red: CGFloat(Des1.value), green: CGFloat(Des2.value), blue: CGFloat(Des3.value), alpha: 1.0)
    }
    
    
    @IBAction func Verde(_ sender: Any) {
        ColorAMostrar.backgroundColor = UIColor(red: CGFloat(Des1.value), green: CGFloat(Des2.value), blue: CGFloat(Des3.value), alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

