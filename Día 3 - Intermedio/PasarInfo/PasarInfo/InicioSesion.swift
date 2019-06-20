//
//  InicioSesion.swift
//  PasarInfo
//
//  Created by Samuel Arturo Garrido Sánchez on 6/19/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit
import Firebase

class InicioSesion: UIViewController {
    
    var ref:DatabaseReference!
    var databaseHandle:DatabaseHandle?
    
    
    @IBOutlet var email: UITextField!
    
    @IBOutlet var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(email.text != "" && password.text != ""){
            print("jj")
        }else{
            let alert = UIAlertController(title: "Error", message: "Ha habidop un error en el log in", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                
            })
            self.present(alert, animated: true)
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
