//
//  AnimalDetailsViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/21/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

private struct Layout {
    static let cellSpacing = 20
}

class AnimalDetailsCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Private properties
    private let collectionView: UICollectionView
    
    //MARK: - Public properties
    var animals = [Animal]()
    
    init() {
        
        let flowLayout                     = UICollectionViewFlowLayout()
        flowLayout.scrollDirection         = .horizontal
        flowLayout.minimumInteritemSpacing = CGFloat(Layout.cellSpacing)
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.registerCell(AnimalDetailCollectionViewCell.self)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: <#T##Double#>, height: <#T##Double#>)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Layout.cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: CGFloat(Layout.cellSpacing), bottom: 0, right: CGFloat(Layout.cellSpacing))
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return visibleCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CustomViewCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        let unlimitedPickCellView = UnlimitedPickCellView()
        cell.customView = unlimitedPickCellView
        
        return cell
    }
    
}
