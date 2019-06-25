//
//  ViewController.swift
//  BibliotecaDeFotos
//
//  Created by Rodrigo Vivas on 6/24/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var saveButton: UIButton!
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var item: Entity? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if item == nil{
            self.navigationItem.title = "Agrega nueva información"
        }else{
            self.navigationItem.title = item?.texttitle
            titleField.text = item?.texttitle
            descriptionField.text = item?.textdescription
            imageView.image = UIImage(data: (item?.image)! as Data)
            
            saveButton.setTitle("Actualizar", for: UIControl.State.normal)
        }
        
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        self.resignFirstResponder()
    }
    
    @IBAction func libreary(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    @IBAction func camera(_ sender: UIButton) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerController.SourceType.camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: UIButton) {
        if item == nil{
            let entityDescription = NSEntityDescription.entity(forEntityName: "Entity", in: pc)
            
            let item = Entity(entity: entityDescription!, insertInto: pc)
            
            item.texttitle = titleField.text
            item.textdescription = descriptionField.text
            item.image = imageView.image!.pngData() as NSData?
        }else{
            item?.texttitle = titleField.text
            item?.textdescription = descriptionField.text
            item?.image = imageView.image!.pngData() as NSData?
        }
        do{
            try pc.save()
        }
        catch{
            print(error)
            return
        }
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
