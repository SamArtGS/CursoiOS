//
//  PerfilSelected.swift
//  PasarInfo
//
//  Created by Samuel Arturo Garrido Sánchez on 6/18/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class PerfilSelected: UIViewController {
    
    
    var numeroRecibido:Int?
    
    
    var nombres: [String] = ["Daniela", "Germán", "Tadeo", "Samuel", "Andrea", "Laura", "Jorge", "Alicia"]
    
    var imagenes: [String] = ["m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8"]
    
    var descripciones: [String] = ["Hola me llamo Daniela", "Hola me llamo Germán", "Hola me llamo Tadeo", "Hola me llamo Samuel", "Hola me llamo Andrea", "Hola me llamo Laura", "Hola me llamo Jorge", "Hola me llamo Alicia"]
    
    @IBOutlet var Imagen: UIImageView!
    
    @IBOutlet var descripcion: UILabel!
    @IBOutlet var Nombre: UILabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        Imagen.image = UIImage(named: imagenes[numeroRecibido ?? 0])
        Nombre.text = nombres[numeroRecibido ?? 0]
        descripcion.text = descripciones[numeroRecibido ?? 0]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
