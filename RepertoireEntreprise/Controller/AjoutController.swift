//
//  AjoutController.swift
//  RepertoireEntreprise
//
//  Created by Benoît Goossens on 27/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import CoreData

class AjoutController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var ajoutEntrepriseButton: UIButton!
    @IBOutlet weak var imageDeProfil: ImageArrondie!
    @IBOutlet weak var prenomTextField: UITextField!
    @IBOutlet weak var nomTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var ajoutContact: ButtonArrondi!
    @IBOutlet weak var largeurContrainte: NSLayoutConstraint!
    @IBOutlet weak var contrainteDuBas: NSLayoutConstraint!
    
    var entreprises = [Entreprise]()
    var imagePicker :UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceImagePicker()
        miseEnPlacePicker()
        miseEnPlaceTextField()
        miseEnPlaceNotification()
        fetchEntreprise()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        largeurContrainte.constant = view.frame.width
        scroll.contentSize = CGSize(width: largeurContrainte.constant, height: scroll.frame.height)
    }
    
    func fetchEntreprise() {
        let requete : NSFetchRequest<Entreprise> = Entreprise.fetchRequest()
        let tri = NSSortDescriptor(key: "nom", ascending: true)
        requete.sortDescriptors = [tri]
        do {
            entreprises = try context.fetch(requete)
            pickerView.reloadAllComponents()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func ajouterEntrepriseAction(_ sender: Any) {
        let alert = UIAlertController(title: "Votre entreprise n'est pas dans la liste", message: "Ajouter", preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "Nom de l'entreprise"
        }
        let ajout = UIAlertAction(title: "OK", style: .default) { (act) in
            let textField = alert.textFields![0] as UITextField
            if let texte = textField.text, texte != "" {
                let nouvelleEntreprise = Entreprise(context: context)
                nouvelleEntreprise.nom = texte
                appDelegate.saveContext()
                self.fetchEntreprise()
            }
        }
        let annuler = UIAlertAction(title: "Annuler", style: .default, handler: nil)
        alert.addAction(ajout)
        alert.addAction(annuler)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func ajouterContactAction(_ sender: Any) {
    }
}
