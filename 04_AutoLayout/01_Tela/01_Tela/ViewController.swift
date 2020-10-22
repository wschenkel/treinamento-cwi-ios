//
//  ViewController.swift
//  01_Tela
//
//  Created by Willian schenkel on 19/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        favoriteButton.layer.borderWidth = 2
        favoriteButton.layer.borderColor = UIColor.systemGray4.cgColor
    }

}
