//
//  AmiiboCell.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/10/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit

class AmiiboCell: UICollectionViewCell {
    
    var optionImage: UIImageView?
    var optionName: UILabel?
    var optionSerie: UILabel?
    var details: UILabel?
    
    func setCell(img: String, name: String, serie: String) {
        optionName?.text = nil
        details?.text = nil
        layer.borderWidth = 0.9
        layer.cornerRadius = 5.0
        
        // Alto y ancho de la celda
        let wCell = frame.width
        let hCell = frame.height
        
        optionImage = UIImageView(frame: CGRect(x: wScreen * 0.06, y: wScreen * 0.08, width: wCell * 0.30, height: hScreen * 0.20))
        self.optionImage?.loadImageFromURL(urlString: img)
        optionImage?.layer.cornerRadius = 7.0
        addSubview(optionImage!)
        
        optionName = UILabel(frame: CGRect(x: (optionImage?.frame.maxX)! * 1.15, y: wScreen * 0.12, width: wCell * 0.55, height: hScreen * 0.03))
        optionName?.text = name
        optionName?.textAlignment = .center
        optionName?.font = UIFont(name: "Helvetica", size: 20)
        optionName?.textColor = UIColor.black
        optionName?.backgroundColor = UIColor.clear
        addSubview(optionName!)
        
        optionSerie = UILabel(frame: CGRect(x: (optionImage?.frame.maxX)! * 1.15, y: (optionName?.frame.maxY)! * 1.3, width: wCell * 0.55, height: hScreen * 0.03))
        optionSerie?.text = serie
        optionSerie?.textAlignment = .center
        optionSerie?.font = UIFont(name: "Helvetica", size: 20)
        optionSerie?.textColor = UIColor.black
        optionSerie?.backgroundColor = UIColor.clear
        addSubview(optionSerie!)
        
        details = UILabel(frame: CGRect(x: (optionImage?.frame.maxX)! * 1.15, y: (optionSerie?.frame.maxY)! * 1.3, width: wCell * 0.55, height: hScreen * 0.03))
        details?.text = "Detalles"
        details?.textAlignment = .center
        details?.font = UIFont(name: "Helvetica", size: 20)
        details?.backgroundColor = UIColor.clear
        addSubview(details!)
    }
}
