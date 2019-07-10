//
//  AmiiboVC.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/9/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit
import Alamofire

class AmiiboVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var opcCollection: UICollectionView?
    var layout: UICollectionViewFlowLayout?
    var amiiboSeriesArray = [String]() {
        didSet {
            self.opcCollection?.reloadData()
        }
    }
    var nameArray = [String]()
    var imageArray = [String]()
    
    var gameSeriesArray = [String]()
    var tailArray = [String]()
    var auArray = [String]()
    var euArray = [String]()
    var jpArray = [String]()
    var naArray = [String]()
    
    var img = [UIImage]()
    var imgAux: UIImageView!
    
    @IBOutlet weak var amiiboLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        service()
    }

    func service() {
        Utils.showSpinnerDelay()
        Alamofire.request("https://www.amiiboapi.com/api/amiibo/?name=mario", method: .get, encoding: URLEncoding.default).responseJSON {
            response in
            
            guard let dataRecieved = response.data else {
                print("no se pudo parsear la respuesta")
                return
            }
            
            guard let userRespuesta = try? JSONDecoder().decode(Amibo.self, from: dataRecieved) else {return}
            
            for item in userRespuesta.amiibo {
                self.amiiboSeriesArray.append(item.amiiboSeries)
                self.nameArray.append(item.name)
                self.imageArray.append(item.image)
                
                self.gameSeriesArray.append(item.gameSeries)
                self.tailArray.append(item.tail)
                self.auArray.append(item.release.au)
                self.euArray.append(item.release.eu)
                self.jpArray.append(item.release.jp)
                self.naArray.append(item.release.na)
                
                self.opcCollection?.reloadData()
            }
        }
    }
    
    
    // Método que carga la interfaz gráfica del controlador
    func loadInterface() {
        
        layout = UICollectionViewFlowLayout()
        layout?.itemSize = CGSize(width: wScreen * 0.85, height: hScreen * 0.30)
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout?.minimumLineSpacing = 10
        layout?.minimumInteritemSpacing = 0
        
        opcCollection = UICollectionView(frame: CGRect(x: 0, y: amiiboLabel.frame.maxY + hScreen * 0.07, width: wScreen * 0.86, height: hScreen * 0.65), collectionViewLayout: layout!)
        opcCollection?.center.x = view.center.x
        opcCollection?.register(AmiiboCell.self, forCellWithReuseIdentifier: "cell")
        opcCollection?.delegate = self
        opcCollection?.dataSource = self
        opcCollection?.backgroundColor = UIColor.clear
        opcCollection?.isScrollEnabled = false
        opcCollection?.bounces = false
        view.addSubview(opcCollection!)
    }
    
    //--Métodos de protocolos implementados--//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return amiiboSeriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? AmiiboCell else { return UICollectionViewCell() }
        cell.setCell(img: imageArray[indexPath.row], name: nameArray[indexPath.row], serie: amiiboSeriesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC else { return }
        viewcontroller.serie = self.gameSeriesArray[indexPath.row]
        viewcontroller.tail = self.tailArray[indexPath.row]
        viewcontroller.au = self.auArray[indexPath.row]
        viewcontroller.eu = self.euArray[indexPath.row]
        viewcontroller.jp = self.jpArray[indexPath.row]
        viewcontroller.na = self.naArray[indexPath.row]
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
