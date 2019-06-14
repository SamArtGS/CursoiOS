//
//  ViewController.swift
//  Dia2
//
//  Created by Samuel Arturo Garrido Sánchez on 6/12/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ColorMostrado: UIView!
    @IBOutlet var Rojo: UISlider!
    @IBOutlet var Azul: UISlider!
    @IBOutlet var Verde: UISlider!
    
    @IBOutlet var Imagen: UIImageView!
    let array:[String] = ["1","2","3","4","5"]
    
    @IBAction func Rojos(_ sender: Any) {
        print(Rojo.value)
        ColorMostrado.backgroundColor = UIColor(red: CGFloat(Rojo.value), green: CGFloat(Verde.value), blue: CGFloat(Azul.value), alpha: 1.0)
    }
    @IBAction func Azules(_ sender: Any) {
        print(Azul.value)
        ColorMostrado.backgroundColor = UIColor(red: CGFloat(Rojo.value), green: CGFloat(Verde.value), blue: CGFloat(Azul.value), alpha: 1.0)
    }
    @IBAction func Verdes(_ sender: Any) {
        print(Verde.value)
        ColorMostrado.backgroundColor = UIColor(red: CGFloat(Rojo.value), green: CGFloat(Verde.value), blue: CGFloat(Azul.value), alpha: 1.0)
    }
    var valor:Int = 0
    @IBAction func Boton(_ sender: Any) {
        if valor == 4{
            valor = 0
        }
        Imagen.image = UIImage(named: "\(valor+1)")
        valor = valor + 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        print("Se activo la func loadView")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("Se activo la func viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("Se activo la func viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("Se activo la func viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("Se activo la func viewDidDisappear")
    }


}

