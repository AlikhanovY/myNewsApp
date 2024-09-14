//
//  LoginViewController.swift
//  myNewsApp
//
//  Created by Alikhanov Yelnur on 12.09.2024.
//

import UIKit
import FirebaseAuth
class LoginViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if emailTextField.text != "", passwordTextField.text != ""{
            return true
        }
        else{
            emailTextField.placeholder = "Type something"
            passwordTextField.placeholder = "Type something"
            return false
        }
    }

    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print("Error happend \(e.localizedDescription)")
                    print("error")
                }
                
            }
        }
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
