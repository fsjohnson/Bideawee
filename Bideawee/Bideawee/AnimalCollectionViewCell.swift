//
//  AnimalCollectionViewCell.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/17/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    var animalPic = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error in AnimalCollectionViewCell")
    }
    
    func setUpView() {
        addSubview(animalPic)
        animalPic.translatesAutoresizingMaskIntoConstraints = false
        animalPic.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        animalPic.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        animalPic.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        animalPic.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
