//
//  AnimalDetailsCollectionViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/21/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

private struct Layout {
    static let cellPadding: CGFloat = 5
    static let imageViewWidthHeight: CGFloat = 160
}

enum AnimalSections: Int {
    case speciesBreed, ageSex, sizeColor
    
    var rows: [AnimalRows] {
        switch self {
        case .speciesBreed:
            return [.species, .breed]
        case .ageSex:
            return [.age, .sex]
        case .sizeColor:
            return [.size, .color]
        }
    }
}

enum AnimalRows {
    case species, breed, age, sex, size, color, count
}

class AnimalDetailsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Private properties
    private let animalImageView = UIImageView()
    private let collectionView: UICollectionView
    private let animalSections: [AnimalSections] = [.speciesBreed, .ageSex, .sizeColor]
    
    //MARK: - Public properties
    var animals = [Animal]()
    
    init() {
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.scrollDirection         = .vertical
        flowLayout.minimumLineSpacing      = 0
        collectionView                     = UICollectionView(frame: .zero, collectionViewLayout:flowLayout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    private func setUpView() {
        
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AnimalDetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailCell")
        
        animalImageView.image = UIImage(named: "catPic")
        view.addSubview(animalImageView)
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        animalImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animalImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        animalImageView.widthAnchor.constraint(equalToConstant: Layout.imageViewWidthHeight).isActive = true
        animalImageView.heightAnchor.constraint(equalToConstant: Layout.imageViewWidthHeight).isActive = true
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: animalImageView.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cvWidth = collectionView.frame.size.width - (2 * Layout.cellPadding)
        return CGSize(width: cvWidth/2, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(Layout.cellPadding), left: 0, bottom: CGFloat(Layout.cellPadding), right: 0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return animalSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalSections[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let animalSections = self.animalSections[indexPath.section]
        let row = animalSections.rows[indexPath.row]
        
        let cell: AnimalDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! AnimalDetailCollectionViewCell
        
        switch row {
        case .species:
            cell.titleLabel.text = "Species"
            cell.detailsLabel.text = "Cat"
            
        case .breed:
            cell.titleLabel.text = "Breed"
            cell.detailsLabel.text = "Domestic Shorthair, Mix"
            
        case .age:
            cell.titleLabel.text = "Age"
            cell.detailsLabel.text = "1 yr 6 mos"
            
        case .sex:
            cell.titleLabel.text = "Sex"
            cell.detailsLabel.text = "F"
            
        case .size:
            cell.titleLabel.text = "Size"
            cell.detailsLabel.text = "M"
            
        case .color:
            cell.titleLabel.text = "Color"
            cell.detailsLabel.text = "Brown"
            
        default:
            break

        }
        
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 1.0

        return cell
    }
    
}
