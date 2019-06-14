//
//  ViewController7.swift
//  PDF's
//
//  Created by Samuel Arturo Garrido Sánchez on 6/13/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func Alerta(_ sender: Any) {
        let alert = UIAlertController(title: "Alerta creadda", message: "Hemos creado una alerta", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            
        })
        self.present(alert, animated: true)
    }
    
   

}
