//
//  Filtros.swift
//  iOSInter
//
//  Created by Samuel Arturo Garrido Sánchez on 6/21/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class Filtros: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet var Imagen: UIImageView!
    
var imagePicker = UIImagePickerController()
    
    @IBAction func Camara(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,animated: true,completion: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "No hay cámara", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            })
            self.present(alert, animated: true)
        }
    }
    @IBAction func Galeria(_ sender: Any) {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        Imagen.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        Imagen.contentMode = .scaleAspectFit
        dismiss(animated:true, completion: nil)
    }
    
    
    @IBOutlet var Boton1: UIButton!
    @IBOutlet var Boton2: UIButton!
    @IBOutlet var Boton3: UIButton!
    @IBOutlet var Boton4: UIButton!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        Boton1.layer.cornerRadius = 20
        Boton2.layer.cornerRadius = 20
        Boton3.layer.cornerRadius = 20
        Boton4.layer.cornerRadius = 20
        imagePicker.delegate = self
        super.viewDidLoad()
    }

}
