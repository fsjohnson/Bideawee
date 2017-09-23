//
//  ResultsTableViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/17/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

enum VCType {
    case results, favorites
}

class ResultsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var animals = [Animal]()
    private let vcType: VCType
    
    init(vcType: VCType) {
        self.vcType = vcType
        super.init(nibName: nil, bundle: nil)
        
        switch vcType {
        case .results:
            title = "Results"
        case .favorites:
            title = "Favorites"
        }
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
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AnimalTableViewCell.self, forCellReuseIdentifier: "imageCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 370
        tableView.isUserInteractionEnabled = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    // MARK: UITableViewDataSource & Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return animals.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! AnimalTableViewCell
        
        //let imageName = animals[indexPath.item].imageLink
        cell.animalPic.image = UIImage(imageLiteralResourceName: "catPic")
        cell.nameLabel.text = "Leo"
        cell.descriptionLabel.text = "Loving and kind, Leo is as gentle as it gets. Leo is a one year old male Domestic Shorthair with an exotic look. Leo has a long and illustrious face with big ears. At 11 pounds, he's on the larger side, which just adds to his intriguing appearance. Leo is a wonderful cat, although he can be slightly timid at first. But with a few scratches behind the ears and some sweet words, Leo begins to open up. He'll lean into your hand for more pets and you'll begin to hear a low purr come from his body. Leo is also big fan of scratches on the back, as you can tell from the way his behind begins to rise high in the air. Leo gets along great with other cats and would be a wonderful companion if you already have a feline. If this gentle soul seems like the one for you, come adopt Leo today!"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AnimalDetailsCollectionViewController()
//        vc.animal = animals[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: false)
    }
}
