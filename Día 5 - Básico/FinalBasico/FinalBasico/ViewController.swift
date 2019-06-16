//
//  ViewController.swift
//  FinalBasico
//
//  Created by Samuel Arturo Garrido Sánchez on 6/14/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet var ProtecoImagen: UIImageView!
    @IBOutlet var Dia1: UIButton!
    @IBOutlet var Dia2: UIButton!
    @IBOutlet var Dia3: UIButton!
    @IBOutlet var Dia4: UIButton!
    @IBOutlet var Dia5: UIButton!
    
    
    
    
    
    @IBAction func IrDia3(_ sender: Any) {
        let ViewControllerDia3 = storyboard?.instantiateViewController(withIdentifier:"Dia3")
        self.navigationController?.pushViewController(ViewControllerDia3!, animated: true)
        
    }
    
    @IBAction func Alerta(_ sender: Any) {
        let alert = UIAlertController(title: "Alerta creadda", message: "Hemos creado una alerta", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            
        })
        self.present(alert, animated: true)
    }
    @IBAction func IrDia4(_ sender: Any) {
        let ViewControllerDia4 = storyboard?.instantiateViewController(withIdentifier:"Dia4")
        self.navigationController?.pushViewController(ViewControllerDia4!, animated: true)
        
    }
    
    @IBAction func IrDia5(_ sender: Any) {
        let ViewControllerDia5 = storyboard?.instantiateViewController(withIdentifier:"Dia5")
        self.navigationController?.pushViewController(ViewControllerDia5!, animated: true)
    }
    override func viewDidLoad() {
        Dia1.tintColor = UIColor.white
        Dia2.tintColor = UIColor.white
        Dia3.tintColor = UIColor.white
        Dia4.tintColor = UIColor.white
        Dia5.tintColor = UIColor.white
        
        ProtecoImagen.image = UIImage(named: "Swift")
        
        ProtecoImagen.layer.cornerRadius = 30
        ProtecoImagen.clipsToBounds = true
        
        
        navigationController?.navigationBar.barTintColor = UIColor.blue
        
        self.title = "Curso Básico iOS"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        super.viewDidLoad()
    
        
    }


}

