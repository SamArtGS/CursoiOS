//
//  ViewController.swift
//  Tablas
//
//  Created by Samuel Arturo Garrido Sánchez on 6/17/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var nombres:[String] = ["José","Juan","Sam","Erick","Minerva","Nory","Carlos"]
    
    var imagenes:[String] = ["img1","img2","img3","img4","img5","img6","img7"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nombres.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Fila Seleccionada", message: "Número \(indexPath.row)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            
        })
        self.present(alert, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     
     let alert = UIAlertController(title: "Fila Seleccionada", message: "Número \(indexPath.row)", preferredStyle: .alert)
     alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
     
     })
     self.present(alert, animated: true)
     }
     
     */
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style:UITableViewCell.CellStyle.default,reuseIdentifier:"miCelda")
        
        celda.textLabel?.text = nombres[indexPath.row]
        
        let image = UIImage(named: imagenes[indexPath.row])
        celda.imageView!.image = image
        celda.backgroundColor = .clear
        
        return celda
        
    }
    
    

    @IBOutlet var Tabla: UITableView!
    
    override func viewDidLoad() {
        Tabla.delegate = self
        Tabla.dataSource = self
        super.viewDidLoad()
    }


}

