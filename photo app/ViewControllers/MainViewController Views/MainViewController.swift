//
//  MainViewController.swift
//  photo app
//
//  Created by t h a . m a m e rozz on 29.06.22.
//

import UIKit

class MainViewController: UIViewController {
//  MARK: - Properties
    static let sectionHeaderElementKind = "section-header-element-kind"
    
    enum Section: String, CaseIterable {
      case myAlbums = "My Albums"
    }
    
    var albumsCollectionView: UICollectionView! = nil
    var dataSource = MyAlbumDataSource.get()
    
//  MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = Strings.mainViewCollectionViewTitle
        configureCollectionView()
        configureDataSource()
    }
}

// MARK: - Extensions
extension MainViewController {
    func configureCollectionView() {
      let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
      view.addSubview(collectionView)
      collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      collectionView.backgroundColor = .systemBackground
      collectionView.delegate = self
      collectionView.register(AlbumItemCell.self, forCellWithReuseIdentifier: AlbumItemCell.reuseIdentifer)
      collectionView.register(FeaturedAlbumItemCell.self, forCellWithReuseIdentifier: FeaturedAlbumItemCell.reuseIdentifer)
      collectionView.register(SharedAlbumItemCell.self, forCellWithReuseIdentifier: SharedAlbumItemCell.reuseIdentifer)
      collectionView.register(
        HeaderView.self,
        forSupplementaryViewOfKind: AlbumsViewController.sectionHeaderElementKind,
        withReuseIdentifier: HeaderView.reuseIdentifier)
      albumsCollectionView = collectionView
    }
    
    func generateLayout() -> UICollectionViewLayout {
      let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
        layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500

        let sectionLayoutKind = Section.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .myAlbums: return self.generateMyAlbumsLayout(isWide: isWideView)
        }
      }
      return layout
    }
    
    func generateFeaturedAlbumsLayout(isWide: Bool) -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .fractionalWidth(2/3))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      // Show one item plus peek on narrow screens, two items plus peek on wider screens
      let groupFractionalWidth = isWide ? 0.475 : 0.95
      let groupFractionalHeight: Float = isWide ? 1/3 : 2/3
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
        heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
      group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

      let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44))
      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
        layoutSize: headerSize,
        elementKind: AlbumsViewController.sectionHeaderElementKind, alignment: .top)

      let section = NSCollectionLayoutSection(group: group)
      section.boundarySupplementaryItems = [sectionHeader]
      section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

      return section
    }
}
