//
//  SearchViewController.swift
//  Bideawee
//
//  Created by Felicity Johnson on 9/9/17.
//  Copyright © 2017 FJ. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    private let petData = ["Cat", "Dog"]
    private let genderData = ["Female", "Male"]
    private let ageData = ["< 1 yr", "> 1 yr"]
    private let locationData = ["Manhattan", "New Arrivals", "Westhampton"]
    private let sortByData = ["Breed", "Gender", "Name"]
    
    private let petDropDownTextField = UITextField()
    private let genderDropDownTextField = UITextField()
    private let ageDropDownTextField = UITextField()
    private let locationDropDownTextField = UITextField()
    private let sortByDropDownTextField = UITextField()
    
    private let stackView = UIStackView()
    private let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        view.backgroundColor = .white
        
        let list = [petDropDownTextField, genderDropDownTextField, ageDropDownTextField, locationDropDownTextField, sortByDropDownTextField]
        setUpDropDowns(with: list)
        setUpConstraints()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        searchButton.setTitle("Search", for: .normal)
        searchButton.layer.borderWidth = 1.0
        searchButton.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setUpDropDowns(with dropDownList: [UITextField]) {
        
        petDropDownTextField.loadDropdownData(data: petData)
        genderDropDownTextField.loadDropdownData(data: genderData)
        ageDropDownTextField.loadDropdownData(data: ageData)
        locationDropDownTextField.loadDropdownData(data: locationData)
        sortByDropDownTextField.loadDropdownData(data: sortByData)
        
        dropDownList.forEach { [weak self] dropDown in
            self?.stackView.addArrangedSubview(dropDown)
            dropDown.layer.borderWidth = 1.0
            dropDown.layer.borderColor = UIColor.black.cgColor
            dropDown.addToolBar()
        }
    }
    
    private func setUpConstraints() {
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
