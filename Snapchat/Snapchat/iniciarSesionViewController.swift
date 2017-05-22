//
//  iniciarSesionViewController.swift
//  Snapchat
//
//  Created by Alejandro Mendoza on 22/05/17.
//  Copyright © 2017 mendoza. All rights reserved.
//

import UIKit
import Firebase

class iniciarSesionViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in print("Intentando iniciar sesion")
            if error != nil {
                print("Tenemos el siguiente error:\(error)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {
                    (user, error) in print("Intentando crear un usuario")
                    if error != nil{
                        print("Tenemos el error \(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else{
                print ("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
        })
        
    }


}

