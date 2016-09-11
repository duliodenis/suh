//
//  ViewController.swift
//  suh
//
//  Created by Dulio Denis on 9/10/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class PhotoListController: UIViewController {

    lazy var cameraButton: UIButton = {
        let button = UIButton(type: .System)
        
        button.setTitle("Camera", forState: .Normal)
        button.tintColor = UIColor(red: 254/255.0, green: 123/255.0, blue: 135/255.0, alpha: 1.0)
        button.backgroundColor = .whiteColor()
        
        button.addTarget(self, action: Selector("presentImagePickerController"), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    
    lazy var mediaPickerManager: MediaPickerManager = {
       return MediaPickerManager(presentingViewController: self)
    }()
    
    
    // MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([
            cameraButton.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
            cameraButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor),
            cameraButton.rightAnchor.constraintEqualToAnchor(view.rightAnchor),
            cameraButton.heightAnchor.constraintEqualToConstant(56.0)
            ])
    }
    
    
    // MARK: - Image Picker Controller
    
    @objc private func presentImagePickerController() {
        mediaPickerManager.presentImagePickerController(animated: true)
    }
}

