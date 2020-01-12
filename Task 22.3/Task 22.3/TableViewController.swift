//
//  TableViewController.swift
//  Task 22.3
//
//  Created by Анастасия Вишневская on 1/9/20.
//  Copyright © 2020 Anastasiya Vishnevskaya. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dukes: [Dukes] = []
    var newDukeName : String = ""
    var newDukeDynasty: String = ""
    var pasteBoard = UIPasteboard.general
    override func viewDidLoad() {
        super.viewDidLoad()
        dukes = createArray()
        navigationItem.rightBarButtonItem = editButtonItem
//        navigationItem.leftBarButtonItem = editButtonItem
        

        

    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let dukeDetailVC = segue.source as! DukeDetailViewController
        newDukeName = dukeDetailVC.name
        newDukeDynasty = dukeDetailVC.dynasty
        
        let newDukeArray = Dukes(name: newDukeName, dynasty: newDukeDynasty, photo: nil, coatOfArms: nil)
        
        dukes.append(newDukeArray)
        
        tableView.reloadData()
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        navigationController?.popViewController(animated: true)
    }

        func createArray () -> [Dukes] {
            let duke1 = Dukes(name: "de Cadiz", dynasty: "Burbon", photo: #imageLiteral(resourceName: "герцог кадисский"), coatOfArms: #imageLiteral(resourceName: "герб кадисский.jpg"))
            let duke2 = Dukes(name: "Marlboro", dynasty: "Churchill", photo: #imageLiteral(resourceName: "герцог мальборо.jpg"), coatOfArms: #imageLiteral(resourceName: "герб мальборо.png"))
            let duke3 = Dukes(name: "Albany", dynasty: "Hannover", photo: #imageLiteral(resourceName: "герцог олбани.jpg"), coatOfArms: #imageLiteral(resourceName: "герб олбани.jpg"))
            let duke4 = Dukes(name: "Franko", dynasty: "Burgundy", photo: #imageLiteral(resourceName: "герцог франко.jpg"), coatOfArms: #imageLiteral(resourceName: "герб Франко.png"))
            let duke5 = Dukes(name: "Gloucester", dynasty: "Hannover", photo: #imageLiteral(resourceName: "герцог глостер.jpg"), coatOfArms: #imageLiteral(resourceName: "герб глостер.jpg"))
            return [duke1, duke2, duke3, duke4, duke5]
            
        }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let duke = dukes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! TableViewCell
        cell.setContact(duke: duke)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dukes.count
    }

    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dukes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
//    override func setEditing(_ editing: Bool, animated: Bool) {
//        // Takes care of toggling the button's title.
//        super.setEditing(!isEditing, animated: true)
//        
//        // Toggle table view editing.
//        tableView.setEditing(!tableView.isEditing, animated: true)
//    }

 


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = dukes[sourceIndexPath.row]
        dukes.remove(at: sourceIndexPath.row)
        dukes.insert(item, at: destinationIndexPath.row)
    }


     // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if (action == #selector(UIResponderStandardEditActions.copy(_:))) {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        let cell = tableView.cellForRow(at: indexPath)
        pasteBoard.string = cell!.textLabel?.text
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
