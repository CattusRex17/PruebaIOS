//
//  DetailsVC.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/10/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var serieLabel: UILabel!
    @IBOutlet weak var tailLabel: UILabel!
    @IBOutlet weak var auLabel: UILabel!
    @IBOutlet weak var euLabel: UILabel!
    @IBOutlet weak var jpLabel: UILabel!
    @IBOutlet weak var naLabel: UILabel!
    
    var serie: String!
    var tail: String!
    var au: String!
    var eu: String!
    var jp: String!
    var na: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serieLabel.text = "Serie de juegos: \(serie!)"
        tailLabel.text = "Tail: \(tail!)"
        auLabel.text = "Australia: \(au!)"
        euLabel.text = "Europa: \(eu!)"
        jpLabel.text = "Japón: \(jp!)"
        naLabel.text = "América del Norte: \(na!)"
    }
}
