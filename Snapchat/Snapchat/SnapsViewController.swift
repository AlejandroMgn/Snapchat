//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Alejandro Mendoza on 22/05/17.
//  Copyright © 2017 mendoza. All rights reserved.
//

import UIKit
import Firebase

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var snaps : [Snap] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {
            (snapshot) in
                let snap = Snap()
            
                snap.imagenURL = (snapshot.value as! NSDictionary)["imagenURL"] as! String
                snap.from = (snapshot.value as! NSDictionary)["from"] as! String
                snap.descrip = (snapshot.value as! NSDictionary)["descripcion"] as! String
                self.snaps.append(snap)
                self.tableView.reloadData()
        })
        
    }

    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    

}
