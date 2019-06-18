//
//  ViewController.swift
//  Dia1Inter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/17/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource{
    
    var palabras:[String] = ["Hola","Bye","Adios","Good","Generacion","Increase","Grease","Proteco","No C que poner","Ya valió"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return palabras.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier: "Celda")
        celda.textLabel?.text = palabras[indexPath.row]
        return celda
    }

    @IBOutlet var Tabla: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabla.delegate = self
        Tabla.dataSource = self
    }


}

