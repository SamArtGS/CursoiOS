//
//  ViewController.swift
//  PDF's
//
//  Created by Samuel Arturo Garrido Sánchez on 6/13/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func Atras(_ sender: Any) {
        let pagPrincipal = storyboard?.instantiateViewController(withIdentifier:"PagPrincipal")
        self.navigationController?.pushViewController(pagPrincipal!, animated: true)
    }
    
    @IBAction func Colores(_ sender: Any) {
        let pagPrincipal = storyboard?.instantiateViewController(withIdentifier:"Colores")
        self.navigationController?.pushViewController(pagPrincipal!, animated: true)
    }
    
    
    @IBAction func Galeria(_ sender: Any) {
        let pagPrincipal = storyboard?.instantiateViewController(withIdentifier:"Galeria")
        self.navigationController?.pushViewController(pagPrincipal!, animated: true)
    }
    
    
    
    @IBAction func Fondo(_ sender: Any) {
        let pagPrincipal = storyboard?.instantiateViewController(withIdentifier:"Alertas")
        self.navigationController?.pushViewController(pagPrincipal!, animated: true)
    }
    
    @IBOutlet var Botones1: UIButton!
    
    @IBOutlet var Botones2: UIButton!
    
    @IBOutlet var Botones3: UIButton!
    
    @IBOutlet var Botones4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Botones3.tintColor = UIColor.white
        Botones4.tintColor = UIColor.white
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
        
        self.view.layer.insertSublayer(gradient, at: 0)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
    }
}

