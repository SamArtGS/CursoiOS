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
            print("Contraseñas no iguales")
            
        }else{
            Auth.auth().createUser(withEmail: correo.text!, password: contrasena.text!){(user,error) in
                
                if error == nil{
                    print("Correcto")
                }else{
                    print("Error contraseña")
                }
                
            }
        }
    }
    
    
    
}
