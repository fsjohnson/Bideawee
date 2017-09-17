//
//  SearchViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/9/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {

    private let petData = ["All", "Cat", "Dog"]
    private let genderData = ["All","Female", "Male"]
    private let ageData = ["All","< 1 yr", "> 1 yr"]
    private let locationData = ["All","Manhattan", "New Arrivals", "Westhampton"]
    private let sortByData = ["All","Breed", "Gender", "Name"]
    
    private let petDropDownTextField = UITextField()
    private let genderDropDownTextField = UITextField()
    private let ageDropDownTextField = UITextField()
    private let locationDropDownTextField = UITextField()
    private let sortByDropDownTextField = UITextField()
    
    private let petLabel = UILabel()
    private let genderLabel = UILabel()
    private let ageLabel = UILabel()
    private let locationLabel = UILabel()
    private let sortLabel = UILabel()
    
    private let petStackView = UIStackView()
    private let genderStackView = UIStackView()
    private let ageStackView = UIStackView()
    private let locationStackView = UIStackView()
    private let sortStackView = UIStackView()
    
    private let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        
        let list = [petDropDownTextField, genderDropDownTextField, ageDropDownTextField, locationDropDownTextField, sortByDropDownTextField]
        setUpDropDowns(with: list)
        
        searchButton.setTitle("Search", for: .normal)
        searchButton.titleLabel?.font = UIFont.themeMediumBold
        searchButton.titleLabel?.textColor = .white
        searchButton.backgroundColor = .black
        searchButton.layer.borderWidth = 1.0
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
        petLabel.text = "Pets:"
        genderLabel.text = "Gender:"
        ageLabel.text = "Age:"
        locationLabel.text = "Location:"
        sortLabel.text = "Sort By:"
    }
    
    private func setUpDropDowns(with dropDownList: [UITextField]) {
        
        petDropDownTextField.loadDropdownData(data: petData)
        genderDropDownTextField.loadDropdownData(data: genderData)
        ageDropDownTextField.loadDropdownData(data: ageData)
        locationDropDownTextField.loadDropdownData(data: locationData)
        sortByDropDownTextField.loadDropdownData(data: sortByData)
        
        dropDownList.forEach { dropDown in
            dropDown.layer.borderWidth = 1.0
            dropDown.layer.borderColor = UIColor.black.cgColor
            dropDown.layer.cornerRadius = 5.0
            dropDown.addToolBar()
        }
        
        setUpStackViews()
    }
    
    private func setUpStackViews() {
        petStackView.axis = .vertical
        petStackView.distribution = .fill
        petStackView.addArrangedSubview(petLabel)
        petStackView.addArrangedSubview(petDropDownTextField)
        
        genderStackView.axis = .vertical
        genderStackView.distribution = .fill
        genderStackView.addArrangedSubview(genderLabel)
        genderStackView.addArrangedSubview(genderDropDownTextField)
        
        ageStackView.axis = .vertical
        ageStackView.distribution = .fill
        ageStackView.addArrangedSubview(ageLabel)
        ageStackView.addArrangedSubview(ageDropDownTextField)
        
        locationStackView.axis = .vertical
        locationStackView.distribution = .fill
        locationStackView.addArrangedSubview(locationLabel)
        locationStackView.addArrangedSubview(locationDropDownTextField)
        
        sortStackView.axis = .vertical
        sortStackView.distribution = .fill
        sortStackView.addArrangedSubview(sortLabel)
        sortStackView.addArrangedSubview(sortByDropDownTextField)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        
        view.addSubview(petStackView)
        petStackView.translatesAutoresizingMaskIntoConstraints = false
        petStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        petStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        petStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        petStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        view.addSubview(genderStackView)
        genderStackView.translatesAutoresizingMaskIntoConstraints = false
        genderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        genderStackView.topAnchor.constraint(equalTo: petStackView.bottomAnchor, constant: 20).isActive = true
        genderStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        genderStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(ageStackView)
        ageStackView.translatesAutoresizingMaskIntoConstraints = false
        ageStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ageStackView.topAnchor.constraint(equalTo: genderStackView.bottomAnchor, constant: 20).isActive = true
        ageStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        ageStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(locationStackView)
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationStackView.topAnchor.constraint(equalTo: ageStackView.bottomAnchor, constant: 20).isActive = true
        locationStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        locationStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(sortStackView)
        sortStackView.translatesAutoresizingMaskIntoConstraints = false
        sortStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sortStackView.topAnchor.constraint(equalTo: locationStackView.bottomAnchor, constant: 20).isActive = true
        sortStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sortStackView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: sortStackView.bottomAnchor, constant: 20).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func searchButtonClicked() {
        print("search")
    }
}
