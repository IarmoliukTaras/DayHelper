//
//  NodeViewController.swift
//  DayHelper
//
//  Created by 123 on 21.01.2018.
//  Copyright © 2018 TarasSoft. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var textView: UITextView!
    
    var editMode: Bool!
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.note != nil {
            editMode = false
            textView.text = self.note!.text
        } else {
            editMode = true
            textView.delegate = self
            textView.text = "Enter Text..."
            textView.textColor = UIColor.lightGray
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        if editMode {
            editMode = false
            if self.note != nil {
                let dict: [String: Any?] = ["text": self.textView.text]
                RealmService.shared.update(self.note!, with: dict)
            } else {
                let newNote = Note(text: textView.text!)
                RealmService.shared.create(newNote)
            }
        } else {
            editMode = true
            
        }
    }
    

}

extension NoteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        self.saveButton.isEnabled = true
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter Text"
            textView.textColor = UIColor.lightGray
        }
        self.saveButton.isEnabled = false
    }
}
