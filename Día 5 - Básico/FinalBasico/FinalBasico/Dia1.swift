import UIKit

class Dia1: UIViewController,UIWebViewDelegate{

    @IBOutlet var SwiftOnline: UIWebView!
    
    override func viewDidLoad() {
        
        SwiftOnline.delegate = self
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: "SwiftLanguage", ofType: "pdf")!)
        let datosPdf = try? Data(contentsOf: direccionPdf)
        SwiftOnline.load(datosPdf!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionPdf)
        SwiftOnline.scalesPageToFit = true
        super.viewDidLoad()
    }
}







