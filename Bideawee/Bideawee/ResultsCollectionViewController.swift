//
//  ResultsCollectionViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/17/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

//private struct Layout {
//    static let cellSpacing: CGFloat = 5
//}

class ResultsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private let layout = UICollectionViewFlowLayout()
    private let collectionView: UICollectionView
    var animals = [Animal]()
    
    init() {
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.scrollDirection         = .vertical
        flowLayout.minimumLineSpacing      = 0
        collectionView                     = UICollectionView(frame: .zero, collectionViewLayout:flowLayout)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error loading ResultsCollectionViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {

        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return animals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! AnimalCollectionViewCell
        
        let imageName = animals[indexPath.item].imageLink
        cell.animalPic.image = UIImage(imageLiteralResourceName: "catPic")
        cell.nameLabel.text = "Tiffany"
        cell.descriptionLabel.text = "Loving and kind, Leo is as gentle as it gets. Leo is a one year old male Domestic Shorthair with an exotic look. Leo has a long and illustrious face with big ears. At 11 pounds, he's on the larger side, which just adds to his intriguing appearance. Leo is a wonderful cat, although he can be slightly timid at first. But with a few scratches behind the ears and some sweet words, Leo begins to open up. He'll lean into your hand for more pets and you'll begin to hear a low purr come from his body. Leo is also big fan of scratches on the back, as you can tell from the way his behind begins to rise high in the air. Leo gets along great with other cats and would be a wonderful companion if you already have a feline. If this gentle soul seems like the one for you, come adopt Leo today!"
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}
