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
    static let cellHeight: CGFloat = 120
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
    private let descriptionLabel = UILabel()
    private let collectionView: UICollectionView
    private let animalSections: [AnimalSections] = [.speciesBreed, .ageSex, .sizeColor]
    
    //MARK: - Public properties
    //    var animal: Animal
    
    // TODO - init with animal
    init() {
//        self.animal = animal
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
        
        title =  "Leo"
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AnimalDetailCollectionViewCell.self, forCellWithReuseIdentifier: "detailCell")
        
        view.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.font = UIFont.themeSmallRegular
        descriptionLabel.text = "Loving and kind, Leo is as gentle as it gets. Leo is a one year old male Domestic Shorthair with an exotic look. Leo has a long and illustrious face with big ears. At 11 pounds, he's on the larger side, which just adds to his intriguing appearance. Leo is a wonderful cat, although he can be slightly timid at first. But with a few scratches behind the ears and some sweet words, Leo begins to open up. He'll lean into your hand for more pets and you'll begin to hear a low purr come from his body. Leo is also big fan of scratches on the back, as you can tell from the way his behind begins to rise high in the air. Leo gets along great with other cats and would be a wonderful companion if you already have a feline. If this gentle soul seems like the one for you, come adopt Leo today!"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: animalImageView.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cvWidth = collectionView.frame.size.width - (2 * Layout.cellPadding)
        return CGSize(width: cvWidth/2, height: Layout.cellHeight)
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
    
    func unfavoriteAnimal() {
        
        if isStarred {
            isStarred = false
            starImage = UIImage(named: "openStar")
            
        } else {
            isStarred = true
            starImage = UIImage(named: "fullStar")
        }
        
        starImageViewButton.setImage(starImage, for: .normal)
    }
    
}
