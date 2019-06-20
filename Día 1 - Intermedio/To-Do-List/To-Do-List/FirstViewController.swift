//
//  FirstViewController.swift
//  To-Do-List
//
//  Created by Ana on 6/16/19.
//  Copyright © 2019 Ana. All rights reserved.
//

import UIKit

///UITableViewDelegate: Métodos para administrar selecciones, configurar encabezados y pies de página, eliminar y reordenar celdas y realizar otras acciones en una vista de tabla.
///UITableViewDataSource: Los métodos adoptados por el objeto que utiliza para administrar datos y proporcionar celdas para una vista de tabla.
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var items: [String] = []
    
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*1let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
        }*/
    }
    ////////segunda parte
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? [String] {
            
            items = tempItems
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")
            
        }
    }

}

