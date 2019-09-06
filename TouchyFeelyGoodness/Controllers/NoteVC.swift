//
//  NoteVC.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 06.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit

class NoteVC: UIViewController {
    
    //Outlets -:
    @IBOutlet private weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension NoteVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NOTE_CELL, for: indexPath) as? NoteCell else { return UITableViewCell() }
        return cell
    }
}
