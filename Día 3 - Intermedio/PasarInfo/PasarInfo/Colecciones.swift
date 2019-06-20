//
//  Colecciones.swift
//  PasarInfo
//
//  Created by Samuel Arturo Garrido Sánchez on 6/19/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class Colecciones: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet var Colecion: UICollectionView!
    
    var imagenes: [String] = ["m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8","m1","m2","m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8","m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8",]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagenes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: "coleccion", for: indexPath) as! ItemCollectonViewCell
        
        celda.Image.image = UIImage(named: imagenes[indexPath.row])
        return celda
    }
    

    override func viewDidLoad() {
        Colecion.delegate = self
        Colecion.dataSource = self
        super.viewDidLoad()
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
