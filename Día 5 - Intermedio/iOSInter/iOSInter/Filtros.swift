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
    
    struct Filter {
        let filterName: String
        var filterEffectValue: Any?
        var filterEffectValueName: String?
        
        init(filterName: String, filterEffectValue: Any?, filterEffectValueName: String?){
            self.filterName = filterName
            self.filterEffectValue = filterEffectValue
            self.filterEffectValueName = filterEffectValueName
        }
        
    }
    
    func applyFilterTo(image: UIImage, filterEffect: Filter) -> UIImage? {
        ///referencia a CoreImage
        guard let cgImage = image.cgImage,
            let openGLContext = EAGLContext(api: .openGLES3) else {
                return nil
        }
        
        let context = CIContext(eaglContext: openGLContext)
        
        let ciImage = CIImage(cgImage: cgImage)
        let filter =  CIFilter(name: filterEffect.filterName)
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        if let filterEffectValue = filterEffect.filterEffectValue,
            let filterEffectValueName = filterEffect.filterEffectValueName {
            filter?.setValue(filterEffectValue, forKey: filterEffectValueName)
        }
        
        var filteredImage: UIImage?
        
        if let output = filter?.value(forKey: kCIOutputImageKey) as? CIImage,
            let cgiImageResult = context.createCGImage(output, from: output.extent) {
            filteredImage = UIImage(cgImage: cgiImageResult)
        }
        
        return filteredImage
    }
    
    @IBOutlet weak var foto: UIImageView!
    var originalFoto: UIImage?
    
    
    @IBAction func sepia(_ sender: Any) {
        foto.image = originalFoto
        guard let image = foto.image else {
            return
        }
        
        foto.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CISepiaTone", filterEffectValue: 1.00, filterEffectValueName: kCIInputIntensityKey))
    }
    
    @IBAction func TransferEffect(_ sender: Any) {
        foto.image = originalFoto
        guard let image = foto.image else {
            return
        }
        
        foto.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIPhotoEffectProcess", filterEffectValue: nil, filterEffectValueName: nil))
    }
    
    @IBAction func NoirEffect(_ sender: Any) {
        foto.image = originalFoto
        guard let image = foto.image else {
            return
        }
        
        foto.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIPhotoEffectNoir", filterEffectValue: nil, filterEffectValueName: nil))
    }
    
    
    @IBAction func blur(_ sender: Any) {
        
        foto.image = originalFoto
        guard let image = foto.image else {
            return
        }
        
        foto.image = applyFilterTo(image: image, filterEffect: Filter(filterName: "CIGaussianBlur", filterEffectValue: 4.0, filterEffectValueName: kCIInputRadiusKey))

    }
    
    @IBAction func clearFilter(_ sender: Any) {
        foto.image = originalFoto
    }
    
    override func viewDidLoad() {
        originalFoto = foto.image
        Boton1.layer.cornerRadius = 20
        Boton2.layer.cornerRadius = 20
        Boton3.layer.cornerRadius = 20
        Boton4.layer.cornerRadius = 20
        imagePicker.delegate = self
        super.viewDidLoad()
    }

}
