//
//  Perfiles.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/21/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class Perfiles: UIViewController,UITableViewDelegate,UITableViewDataSource{
    

    var nombres: [String] = ["Daniela", "Germán", "Tadeo", "Samuel", "Andrea", "Laura", "Jorge", "Alicia"]
    
    var imagenes: [String] = ["m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8"]
    
    var descripciones: [String] = ["Hola me llamo Daniela", "Hola me llamo Germán", "Hola me llamo Tadeo", "Hola me llamo Samuel", "Hola me llamo Andrea", "Hola me llamo Laura", "Hola me llamo Jorge", "Hola me llamo Alicia"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "CeldaUser") as! CeldaUsuario
        celda.Perfil.clipsToBounds = true
        celda.Perfil.layer.cornerRadius = 20
        
        celda.Nombre.text = nombres[indexPath.row]
        
        celda.Perfil.image = UIImage(named: imagenes[indexPath.row])
        celda.Descripcion.text = descripciones[indexPath.row]
        return celda
    }
    
    @IBOutlet var Tabla: UITableView!
    
    override func viewDidLoad() {
        Tabla.delegate = self
        Tabla.dataSource = self
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        PerfilSeleccionado.numero = indexPath.row
        let viewController = storyboard?.instantiateViewController(withIdentifier:"Usuario")
        self.navigationController?.pushViewController(viewController!, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
