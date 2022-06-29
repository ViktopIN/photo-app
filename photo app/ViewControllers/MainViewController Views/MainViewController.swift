//
//  MainViewController.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 29.06.22.
//

import UIKit

class MainViewController: UIViewController {
//  MARK: - Properties
    var myAlbumVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    // TODO: - shapelayer line
    
    var myAlbumStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    var myAlbumLabel: UILabel = {
        let label = UILabel()
        
        label.text = Strings.myAlbumLabelText
        label.font = UIFont(name: "HelveticaNeue-Bold", size: Metrics.myAlbumLabelFontSize)
        
        return label
    }()
    
    var myAlbumButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle(Strings.myAlbumButtonText, for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metrics.myAlbumButtonLabelSize)
        
        return button
    }()
    
//    var myAlbumsCollectionView: myAlbumCollectionView = {
//        let collectionView = myAlbumCollectionView()
//
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }()
    
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hierarchySetup()
        layoutSetup()
        viewSetup()
    }
    
//  MARK: - Settings
    private func hierarchySetup() {
        view.addSubview(myAlbumVerticalStackView)
        
        myAlbumVerticalStackView.addArrangedSubview(myAlbumStackView)
        
        myAlbumStackView.addArrangedSubview(myAlbumLabel)
        myAlbumStackView.addArrangedSubview(myAlbumButton)
//        myAlbumStackView.addArrangedSubview(myAlbumsCollectionView)
    }
    
    private func layoutSetup() {
        myAlbumStackView.translatesAutoresizingMaskIntoConstraints = false
        myAlbumButton.translatesAutoresizingMaskIntoConstraints = false
        myAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            myAlbumStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            myAlbumStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            myAlbumStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            myAlbumLabel.leadingAnchor.constraint(equalTo: myAlbumStackView.leadingAnchor),
            
            myAlbumButton.centerXAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20)
        ])
    }
    
    private func viewSetup() {
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = Strings.mainViewCollectionViewTitle
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonAction))
    }

//  MARK: - Methods
    @objc func plusButtonAction() {
        print("Tapped plus button")
    }
}
