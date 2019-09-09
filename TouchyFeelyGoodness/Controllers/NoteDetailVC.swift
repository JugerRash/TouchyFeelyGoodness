//
//  NoteDetailVC.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 09.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class NoteDetailVC: UIViewController {
    
    //Outlets -:
    @IBOutlet private weak var messageTxtView : UITextView!
    
    //Variables -:
    var note : Note!
    var index : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        messageTxtView.text = note.message
    }
    //Actions -:
    @IBAction func lockNoteBtnPressed(_ sender : Any){
        noteArray[index].status = noteStatusFlipper(note.status)
        navigationController?.popViewController(animated: true)
    }

}
