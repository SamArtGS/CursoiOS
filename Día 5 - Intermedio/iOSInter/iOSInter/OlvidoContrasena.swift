//
//  OlvidoContrasena.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/21/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import FirebaseAuth

class OlvidoContrasena: UIViewController {
    @IBOutlet var correo: UITextField!
    
    @IBAction func EnviarCorreo(_ sender: Any) {
        if correo.text! == ""{
            let alert = UIAlertController(title: "Sin correo", message: "Debes escribir un correo", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            })
            self.present(alert, animated: true)
        }else{
        
        
        Auth.auth().sendPasswordReset(withEmail: correo.text!){(error) in
            if error == nil{
                let alert = UIAlertController(title: "Correo enviado", message: "Se envió un correo para restablecer contraseña", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                })
                self.present(alert, animated: true)
            }else{
                let alert = UIAlertController(title: "Hubo un error", message: "se presentó un error al localizar tu cuenta", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                })
                self.present(alert, animated: true)
            }
            
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.cyan.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        self.hideKeyboardWhenTappedAround()
    }

}
