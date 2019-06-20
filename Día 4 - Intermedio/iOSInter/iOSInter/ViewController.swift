//
//  ViewController.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/20/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import FirebaseUI
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet var correo: UITextField!
    
    @IBOutlet var contrasena: UITextField!
    
    @IBAction func InicioSesion(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



extension ViewController:FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil{
            return
        }
        performSegue(withIdentifier: "InicioSesion", sender: self)
    }
    
    

}
