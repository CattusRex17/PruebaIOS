//
//  Utils.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/9/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import SwiftSpinner

class Utils: NSObject {
    
    public static func validateRegex(type: RegexType, stringToValidate: String) -> Bool {
        let valid = NSPredicate(format: "SELF MATCHES %@", type.rawValue)
        return valid.evaluate(with: stringToValidate)
    }
    
    public static func showSpinnerDelay() {
        SwiftSpinner.show("Cargando ...", animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            hideSpinner()
        }
    }
    
    public static func hideSpinner() {
        SwiftSpinner.hide()
    }
}

//Expresiones regulares para usuario y contraseña
public enum RegexType: String {
    case user = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}



