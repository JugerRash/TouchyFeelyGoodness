//
//  NoteCell.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 06.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    //Outlets -:
    @IBOutlet private weak var messageLbl : UILabel!
    @IBOutlet private weak var lockImageView : UIImageView!

    //Functions -:
    func configureCell(note : Note){
        if note.status == LockStatus.locked {
            self.messageLbl.text = "This message is locked please unlock to read it."
            self.lockImageView.isHidden = false
        }else {
            self.messageLbl.text = note.message
            self.lockImageView.isHidden = true 
        }
    }

}
