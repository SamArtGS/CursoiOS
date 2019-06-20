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
        
    }

    @IBAction func registrar(_ sender: Any) {
        if contrasena.text != confContrasena.text{
        let alert = UIAlertController(title: "Error Constraseña", message: "No has colocado la contraseña correctamente", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            Auth.auth().createUser(withEmail: correo.text!, password: contrasena.text!){(user,error) in
                
                if error == nil{
                    self.performSegue(withIdentifier: "InicioSesion", sender: self)
                }
                
            }
        }
    }
    
}
