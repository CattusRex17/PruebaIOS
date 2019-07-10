//
//  UIImageExtension.swift
//  PruebaIcecode
//
//  Created by Mauricio Rodriguez on 7/10/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageFromURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let imageRetrieved = UIImage(data: data) else { return }
        self.image = imageRetrieved
    }
}
