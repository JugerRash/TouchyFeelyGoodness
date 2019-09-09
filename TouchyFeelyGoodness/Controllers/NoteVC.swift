//
//  NoteVC.swift
//  TouchyFeelyGoodness
//
//  Created by juger rash on 06.09.19.
//  Copyright © 2019 juger rash. All rights reserved.
//

import UIKit
import LocalAuthentication

class NoteVC: UIViewController {
    
    //Outlets -:
    @IBOutlet private weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Functions -:
    func pushNote(foreIndexPath indexPath : IndexPath){
        guard let noteDetailVC = storyboard?.instantiateViewController(withIdentifier: "NoteDetailVC") as? NoteDetailVC else { return }
        noteDetailVC.note = noteArray[indexPath.row]
        noteDetailVC.index = indexPath.row
        navigationController?.pushViewController(noteDetailVC, animated: true)
    }
    
    func authenticateBiometrics(handler : @escaping (Bool) -> Void){
        let myContext = LAContext()
        let myLocalizedReasonString = "Our app uses biometrics touchID / faceID to secure ur notes"
        var authError : NSError?
        
        if #available(iOS 8.0 , iOSMac 10.2.1 , *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { (success, evaluateError) in
                    if success {
                        handler(true)
                    }else {
                        guard let evaluateErrorString = evaluateError?.localizedDescription else { return }
                        self.showAlert(message: evaluateErrorString)
                        handler(false)
                    }
                }
            } else {
                guard let authErrorString = authError?.localizedDescription else { return }
                self.showAlert(message: authErrorString)
                handler(false)
            }
        }else {
            handler(false)
        }

    }
    
    func showAlert(message : String ){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

}

extension NoteVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NOTE_CELL, for: indexPath) as? NoteCell else { return UITableViewCell() }
        let note = noteArray[indexPath.row]
        cell.configureCell(note: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if noteArray[indexPath.row].status == .locked {
            authenticateBiometrics { (success) in
                if success {
                    let lockStatus = noteArray[indexPath.row].status
                    noteArray[indexPath.row].status = noteStatusFlipper(lockStatus)
                    DispatchQueue.main.async {
                        self.pushNote(foreIndexPath: indexPath)
                    }
                }
            }
        } else {
            pushNote(foreIndexPath: indexPath)
        }
    }
}
