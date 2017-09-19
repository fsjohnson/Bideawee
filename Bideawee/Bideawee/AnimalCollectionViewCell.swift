//
//  AnimalCollectionViewCell.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/17/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

private struct Layout {
    static let animalPicWidthHeight: CGFloat = 60.0
    static let descriptionLabelHeight: CGFloat = 50.0
}

class AnimalCollectionViewCell: UICollectionViewCell {
    
    var animalPic = UIImageView()
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error in AnimalCollectionViewCell")
    }
    
    func setUpView() {
        addSubview(animalPic)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        animalPic.contentMode = .scaleAspectFit
        
        animalPic.translatesAutoresizingMaskIntoConstraints = false
        animalPic.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        animalPic.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        animalPic.widthAnchor.constraint(equalToConstant: Layout.animalPicWidthHeight).isActive = true
        animalPic.heightAnchor.constraint(equalToConstant: Layout.animalPicWidthHeight).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: animalPic.bottomAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
    }
}
