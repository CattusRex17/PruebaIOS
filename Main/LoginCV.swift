//
//  ViewController.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/9/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import Alamofire

class LoginCV: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.text = UserDefaults.standard.string(forKey: "user_name") ?? ""
        passwordTextField.text = UserDefaults.standard.string(forKey: "password_name") ?? ""
        }
    
    //Alerta
    func alert(title: String, mesaje: String){
        let alert = UIAlertController(title: title, message: mesaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:	
                print("destructive")
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Método para validar campos
    func validations () {
        
        guard let user = userTextField?.text else {return}
        guard let password = passwordTextField?.text else {return}
        
        if user.isEmpty || !validateRegex(.user, user) {
            alert(title: "Error", mesaje: "Verifica el campo usuario")
            
        } else if password.isEmpty {
            alert(title: "Error", mesaje: "Verifica el campo contraseña")
            
        } else {
            UserDefaults.standard.set(user, forKey: "user_name")
            UserDefaults.standard.set(password, forKey: "password_name")
            
            guard let viewCon = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AmiiboVC") as? AmiiboVC else {return}
           navigationController?.pushViewController(viewCon, animated: true)
        }
    }
    
    
    //Método que llama a funcion regex
    func validateRegex(_ type: RegexType, _ stringToValidate: String) -> Bool {
        return  Utils.validateRegex(type: type, stringToValidate: stringToValidate)
    }
    
    //Método para tabular de un campo a otro
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
            
        case userTextField:
            passwordTextField?.becomeFirstResponder()
        default:
            passwordTextField?.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        validations()
    }
    
}

