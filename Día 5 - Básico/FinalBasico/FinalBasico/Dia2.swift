//
//  Dia2.swift
//  FinalBasico
//
//  Created by Samuel Arturo Garrido Sánchez on 6/14/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

struct  Mydeseo {
    
    func respuesta(deseo: String) -> String {
        switch deseo {
        case "Carro":
            return "Ya tendrás carro"
        case "Casa":
            return "Cumplido: Casa"
        case "Amor":
            return "Nel prro"
        case "Fama":
            return "Famoso papu"
        case "Fortuna":
            return "Cumplido príncipe"
        default:
            return "No C weno si pero no te wa decir"
        }
    }
}

class Dia2: UIViewController {
    @IBOutlet var resposeLabel: UILabel!
    @IBOutlet var wishField: UITextField!
    @IBOutlet var wishButton: UIButton!
    
    
    let respuesta = Mydeseo ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishButton.layer.cornerRadius = 20
        wishField.becomeFirstResponder()
    }
    
    func respondToWish(wish: String) {
        let respuestaADeseo = respuesta.respuesta(deseo: wish)
        
        displayLabelOnScreen(respuestaADeseo)
        
    }
    
    @IBAction func pushWish(_ sender: Any) {
        guard wishField.text != nil else{
            return
        }
        
        respondToWish(wish: wishField.text ?? "")
    }
    
    func displayLabelOnScreen(_ respuesta: String) {
        resposeLabel.text = respuesta
    }
    
    
    
}
