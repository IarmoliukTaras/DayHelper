//
//  NotesViewController.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var notes: Results<Note>!
    var notificationToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        self.notes = realm.objects(Note.self)
        self.notificationToken = realm.observe({ (_, _) in
            self.tableView.reloadData()
        })
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            print(error ?? "no error finded")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        guard let destination = segue.destination as? NoteViewController else { return }
        guard let note = sender as? Note else {return}
        destination.note = note
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        self.notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
}

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell {
            let note = self.notes[indexPath.row]
            cell.configUI(note: note)
            return cell
        } else {
           return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let notes = self.notes[indexPath.row]
        RealmService.shared.delete(notes)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = self.notes[indexPath.row]
        performSegue(withIdentifier: "ToEditNote", sender: note)
    }
    
}
