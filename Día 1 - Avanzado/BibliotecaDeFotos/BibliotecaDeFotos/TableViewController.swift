//
//  TableViewController.swift
//  BibliotecaDeFotos
//
//  Created by Rodrigo Vivas on 6/24/19.
//  Copyright © 2019 Rodrigo. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var frc: NSFetchedResultsController = NSFetchedResultsController<NSFetchRequestResult>()
    
    var pc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //Función que me permite realizar las acciones de mi base de datos
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult>{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        let sorter = NSSortDescriptor(key: "texttitle", ascending: true)
        fetchRequest.sortDescriptors = [sorter]
        return fetchRequest
    }
    
    //Función para obtener los datos que tengo guardados en mi contenedor
    func getFRC() -> NSFetchedResultsController<NSFetchRequestResult>{
        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: pc, sectionNameKeyPath: nil, cacheName: nil)
        return frc
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        frc = getFRC() //Mando a llamar lo que tengo guardado
        frc.delegate = self
        
        do{
            try frc.performFetch() //Ejecuta la acción al obtener los datos
        }
        catch{
            print(error)
            return
        }
        self.tableView.reloadData() //Recargar las vistas del tableView
        self.tableView.rowHeight = 120
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfRows = frc.sections?[section].numberOfObjects
        return numberOfRows!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let item = frc.object(at: indexPath) as! Entity
        cell.cellTitle.text = item.texttitle
        cell.cellDescription.text = item.textdescription
        cell.cellImage.image = UIImage(data: (item.image)! as Data)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       
        let managedObject: NSManagedObject = frc.object(at: indexPath) as! NSManagedObject
        
        pc.delete(managedObject)
        
        do{
            try pc.save()
        }
        catch{
            print(error)
            return
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Pasamos la información de la celda mediante el segue
        if segue.identifier == "edit"{
            let cell = sender as! TableViewCell
            let indexPath = tableView.indexPath(for: cell)
            
            let itemController: ViewController = segue.destination as! ViewController
            
            let item: Entity = frc.object(at: indexPath!) as! Entity
            
            itemController.item = item
        }
        
    }
    

}
