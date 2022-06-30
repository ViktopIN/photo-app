//
//  MainViewController.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 29.06.22.
//

import UIKit

class MainViewController: UIViewController {
//  MARK: - Properties
    private lazy var firstLineView = addLineView()
    
    private lazy var myAlbumStackView = addStackView(axis: .horizontal,
                                                     distribution: .fillProportionally)
 
    private lazy var myAlbumLabel = addLabel(text: Strings.myAlbumLabelText,
                                             font: UIFont(name: "HelveticaNeue-Bold", size: Metrics.myAlbumLabelFontSize) ?? .systemFont(ofSize: Metrics.myAlbumLabelFontSize))
    
    private lazy var myAlbumButton: UIButton = {
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
        view.addSubview(firstLineView)
        view.addSubview(myAlbumStackView)
        
        myAlbumStackView.addArrangedSubview(myAlbumLabel)
        myAlbumStackView.addArrangedSubview(myAlbumButton)
//        myAlbumStackView.addArrangedSubview(myAlbumsCollectionView)
    }
    
    private func layoutSetup() {
        let margins = view.layoutMarginsGuide
        
        firstLineView.translatesAutoresizingMaskIntoConstraints = false
        myAlbumStackView.translatesAutoresizingMaskIntoConstraints = false
        myAlbumButton.translatesAutoresizingMaskIntoConstraints = false
        myAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstLineView.topAnchor.constraint(equalTo: margins.topAnchor),
            firstLineView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            firstLineView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            myAlbumStackView.topAnchor.constraint(equalTo: firstLineView.bottomAnchor,
                                                  constant: Metrics.myAlbumStackViewTopInset),
            myAlbumStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            myAlbumStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            myAlbumLabel.leadingAnchor.constraint(equalTo: myAlbumStackView.leadingAnchor),
            
            myAlbumButton.centerXAnchor.constraint(equalTo: margins.trailingAnchor,
                                                   constant: Metrics.myAlbumButtonXAnchorInset)
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
    
//  MARK: - Private methods
    private func addStackView(axis: NSLayoutConstraint.Axis,
                              spacing: CGFloat = 0,
                              distribution:  UIStackView.Distribution) -> UIStackView {
            let stackView = UIStackView()
        
            stackView.axis = axis
            stackView.spacing = spacing
            stackView.distribution = distribution
        
            return stackView
        }
    
    private func addLabel(text: String, font: UIFont) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = font
        
        return label
    }
    
    private func addLineView() -> UIView {
        let lineView = UIView()
        
        let shapeLayer = CAShapeLayer()
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 0, y: 0))
        linePath.addLine(to: CGPoint(x: 926, y: 0))
        
        shapeLayer.path = linePath.cgPath
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.3).cgColor
        
        lineView.layer.addSublayer(shapeLayer)
        
        return lineView
    }
}
