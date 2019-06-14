//
//  ViewController2.swift
//  PDF's
//
//  Created by Samuel Arturo Garrido Sánchez on 6/13/19.
//  Copyright © 2019 SamArtGS. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIWebViewDelegate{
    
    @IBOutlet var MostrarPDF: UIWebView!
    
    override func viewDidLoad() {
        MostrarPDF.delegate = self
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: "Referencia", ofType: "pdf")!)
        let datosPdf = try? Data(contentsOf: direccionPdf)
        MostrarPDF.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
        MostrarPDF.scalesPageToFit = true
        super.viewDidLoad()
       
    }
    

}
