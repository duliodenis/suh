//
//  PhototFilterController.swift
//  suh
//
//  Created by Dulio Denis on 9/11/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class PhototFilterController: UIViewController {
    
    private var mainImage: UIImage
    
    // Photo Image View
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    // Filter Header Label
    private lazy var filterHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Select a filter"
        label.textAlignment = .Center
        return label
    }()
    
    lazy var filtersCollection: UICollectionView = {
        // generate the required layout instance
        let flowLayout = UICollectionViewFlowLayout()
        // set its scroll direction
        flowLayout.scrollDirection = .Horizontal
        // and set the spacing between items
        flowLayout.minimumLineSpacing = 10
        // with one large row versus multiple rows in a grid
        flowLayout.minimumInteritemSpacing = 1000
        // set the size of each item
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        collection.backgroundColor = .whiteColor()
        
        return collection
    }()
    
    init(image: UIImage) {
        self.mainImage = image
        self.photoImageView.image = self.mainImage
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // Layout Code
    override func viewWillLayoutSubviews() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(photoImageView)
        
        filterHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filterHeaderLabel)
        
        filtersCollection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(filtersCollection)
        
        NSLayoutConstraint.activateConstraints([
            filtersCollection.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            filtersCollection.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            filtersCollection.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            filtersCollection.heightAnchor.constraintEqualToConstant(200.0),
            filtersCollection.topAnchor.constraintEqualToAnchor(filterHeaderLabel.bottomAnchor),
            filterHeaderLabel.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            filterHeaderLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            photoImageView.bottomAnchor.constraintEqualToAnchor(filtersCollection.topAnchor),
            photoImageView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            photoImageView.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            photoImageView.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
            ])
    }
    
}
