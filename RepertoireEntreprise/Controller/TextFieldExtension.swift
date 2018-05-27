//
//  TextFieldExtension.swift
//  RepertoireEntreprise
//
//  Created by Benoît Goossens on 27/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

extension AjoutController : UITextFieldDelegate {
    
    func miseEnPlaceTextField() {
        prenomTextField.delegate = self
        nomTextField.delegate = self
        telTextField.delegate = self
        mailTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
