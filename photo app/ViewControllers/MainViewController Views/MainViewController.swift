//
//  MainViewController.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 29.06.22.
//

import UIKit

class MainViewController: UIViewController {
//  MARK: - Properties
    var myAlbumStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    var myAlbumLabel: UILabel = {
        let label = UILabel()
        
        label.text = Strings.myAlbumLabelText
        label.font = .systemFont(ofSize: Metrics.myAlbumLabelSize)
        
        return label
    }()
    
    var myAlbumButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle(Strings.myAlbumButtonText, for: .normal)
        button.setTitleColor(.link, for: .normal)
        
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
        view.addSubview(myAlbumStackView)
        
        myAlbumStackView.addArrangedSubview(myAlbumLabel)
        myAlbumStackView.addArrangedSubview(myAlbumButton)
//        myAlbumStackView.addArrangedSubview(myAlbumsCollectionView)
    }
    
    private func layoutSetup() {
        
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
