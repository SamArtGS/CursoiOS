//
//  Registro.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/20/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import FirebaseAuth

class Registro: UIViewController {
    @IBOutlet var correo: UITextField!
    
    @IBOutlet var confContrasena: UITextField!
    @IBOutlet var contrasena: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.orange.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        self.hideKeyboardWhenTappedAround()
        
    }

    @IBAction func registrar(_ sender: Any) {
        if contrasena.text != confContrasena.text{
            let alert = UIAlertController(title: "Error", message: "Las contraseñas no coinciden", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            })
            self.present(alert, animated: true)
            
        }else{
            Auth.auth().createUser(withEmail: correo.text!, password: contrasena.text!){(user,error) in
                
                if error == nil{
                    let alert = UIAlertController(title: "⭐️ Correcto ⭐️", message: "Registro completado", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                    })
                    self.present(alert, animated: true)
                    
                    Auth.auth().currentUser?.sendEmailVerification { (error) in
                        if error == nil{
                            let alert = UIAlertController(title: "⭐️ Correcto ⭐️", message: "Registro correcto. Se enviará un correo de confirmación", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                            })
                            self.present(alert, animated: true)
                        }else{
                            let alert = UIAlertController(title: "Hubo un error", message: "Se presentó un error al enviar correo de confirmación", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                            })
                            self.present(alert, animated: true)
                        }
                    }
                }else{
                    let alert = UIAlertController(title: "Hubo un error", message: "Se presentó un error al registrarte", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                    })
                    self.present(alert, animated: true)
                }
                
            }
        }
    }
    
    
    
}
