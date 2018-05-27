//
//  AjoutController.swift
//  RepertoireEntreprise
//
//  Created by Benoît Goossens on 27/05/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.darkGray
        largeurContrainte.constant = view.frame.width
        scroll.contentSize = CGSize(width: largeurContrainte.constant, height: scroll.frame.height)
    }
    
    @IBAction func ajouterEntrepriseAction(_ sender: Any) {
    }
    
    @IBAction func ajouterContactAction(_ sender: Any) {
    }
}
