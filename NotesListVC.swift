//
//  NotesListVC.swift
//  IOS
//
//  Created by Ivan Sales Mendez on 23/2/24.
//

import Foundation
import UIKit

class NotesLisVC: UIViewController, UITableViewDataSource{
    @IBOutlet weak var table: UITableView!
   
    var notesList: [Note] = []
    
    var noteDetailVC: NoteDetailVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Datasource: Quien te dira los datos y las cosas
        table.dataSource = self
        
        //PlayerPrefs
        let defaults = UserDefaults.standard
        
        if let notes = defaults.read([Note].self, key: "NotesSaved"){
            notesList = notes
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let noteDetailVC = storyboard.instantiateViewController(withIdentifier: "NoteDetailVC") as? NoteDetailVC{
            
            noteDetailVC.onCancel = {
                noteDetailVC.dismiss(animated: true)
            }
            
            noteDetailVC.onSave = { title, content in
                self.addNote(title: title, content: content)
                self.table.reloadData()
                
                self.saveNotesList()
                
                noteDetailVC.dismiss(animated: true)
                
            }
            
            self.noteDetailVC = noteDetailVC
        }
        
    }
    
    //Funcion cuantas celdas hay
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    //Funcion info de la celda de index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteCell else {
            return UITableViewCell()
        }
        let note = notesList[indexPath.row]
        cell.title.text = note.title
        cell.content.text = note.content
        
        cell.onClick = {
            if let noteDetailVC = self.noteDetailVC{
                self.present(noteDetailVC, animated: true)
                
                noteDetailVC.setMode(mode: .update)
                noteDetailVC.onUpdate = {title, content in
                    cell.title.text = title
                    cell.content.text = content
                    
                    self.notesList[indexPath.row].title = title
                    self.notesList[indexPath.row].content = content
                    
                    self.saveNotesList()
                    
                    noteDetailVC.dismiss(animated: true)
                }
                
                noteDetailVC.prepare(title: note.title, content: note.content)
            }
        }
        
        return cell
    }
    
    @IBAction func addNoteBtnPressed(_ sender: Any) {
        if let noteDetailVC = self.noteDetailVC{
            noteDetailVC.setMode(mode: .create)
            noteDetailVC.clear()
            self.present(noteDetailVC, animated: true)
        }
        
    }
    
    func addNote(title: String, content: String){
        notesList.append(Note(title: title, content: content))
    }
    
    func saveNotesList(){
        let defaults = UserDefaults.standard
        defaults.save(self.notesList, key: "NotesSaved")
        defaults.synchronize()
    }
}
