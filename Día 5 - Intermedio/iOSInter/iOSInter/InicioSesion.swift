//
//  ViewController.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/20/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import FirebaseAuth

class InicioSesion: UIViewController {
    
    
    @IBOutlet var correo: UITextField!
    
    @IBOutlet var contrasena: UITextField!
    
    @IBOutlet var Logo: UIImageView!
    
    
    @IBAction func InicioSesion(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: correo.text!, password: contrasena.text!){(user,error) in
            if error == nil{
                self.performSegue(withIdentifier: "logeocorrecto", sender: self)
            }else{
                let alert = UIAlertController(title: "Hubo un error", message: "Correo o contraseña incorrectos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                })
                self.present(alert, animated: true)
            }
            
        }
    }

    @IBOutlet var Reg: UIButton!
    @IBOutlet var OC: UIButton!
    @IBOutlet var inicioSesion: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logo.image = UIImage(named: "logo")
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
       Reg.layer.cornerRadius = 10
       OC.layer.cornerRadius = 10
        
       inicioSesion.layer.cornerRadius = 10
        Logo.layer.cornerRadius = 20
        Logo.clipsToBounds = true
        self.view.layer.insertSublayer(gradient, at: 0)
        self.hideKeyboardWhenTappedAround()
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
