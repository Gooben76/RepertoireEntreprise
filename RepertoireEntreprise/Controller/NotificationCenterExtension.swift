//
//  NotificationCenterExtension.swift
//  RepertoireEntreprise
//
//  Created by Benoît Goossens on 27/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

extension AjoutController {
    
    func miseEnPlaceNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(rentrerKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sortirKeyboard), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func rentrerKeyboard(notification:Notification) {
        UIView.animate(withDuration: 0.35) {
            self.contrainteDuBas.constant = 0
        }
    }
    
    @objc func sortirKeyboard(notification:Notification) {
        if let hauteur = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgSizeValue.height {
            UIView.animate(withDuration: 0.35) {
                self.contrainteDuBas.constant = -hauteur
            }
        }
    }
}
