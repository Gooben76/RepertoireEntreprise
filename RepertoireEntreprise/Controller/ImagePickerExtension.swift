//
//  ImagePickerExtension.swift
//  RepertoireEntreprise
//
//  Created by Benoît Goossens on 27/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

extension AjoutController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func miseEnPlaceImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.allowsEditing = true
        imageDeProfil.isUserInteractionEnabled = true
        imageDeProfil.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(prendrePhoto)))
    }
    
    @objc func prendrePhoto() {
        guard imagePicker != nil else {return}
        let action = UIAlertController(title: "Prendre photo", message: "Sélectionnez votre média :", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker!.sourceType = .camera
                self.present(self.imagePicker!, animated: true, completion: nil)
            }
        }
        let librari = UIAlertAction(title: "Bibliothèque", style: .default) { (action) in
            self.imagePicker!.sourceType = .photoLibrary
            self.present(self.imagePicker!, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Annuler", style: .destructive, handler: nil)
        action.addAction(camera)
        action.addAction(librari)
        action.addAction(annuler)
        self.present(action, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker?.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image : UIImage?
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = photo
        } else if let modifiee = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = modifiee
        }
        imageDeProfil.image = image
        imagePicker?.dismiss(animated: true, completion: nil)
    }
}

