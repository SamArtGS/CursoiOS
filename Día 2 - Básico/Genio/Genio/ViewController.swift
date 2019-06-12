//
//  ViewController.swift
//  Genio
//
//  Created by Samuel Arturo Garrido Sánchez on 6/11/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resposeLabel: UILabel!
    @IBOutlet weak var wishField: UITextField!
    @IBOutlet weak var wishButton: UIButton!
    
    
    let respuesta = Mydeseo ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wishField.becomeFirstResponder()
    }
    
    func respondToWish(wish: String) {
        let respuestaADeseo = respuesta.respuesta(deseo: wish)
        displayLabelOnScreen(respuestaADeseo)
        wishField.placeholder = "Dime otro de tus deseos"
        wishField.text = nil
        wishButton.isEnabled = false
        
    }
    
    @IBAction func pushWish(_ sender: Any) {
        guard wishField.text != nil else{
            return
        }
        
        respondToWish(wish: wishField.text ?? "Hola")
    }
    func displayLabelOnScreen(_ respuesta: String) {
        resposeLabel.text = "holA"
    }
    


}

