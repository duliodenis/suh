//
//  MediaPickerManager.swift
//  suh
//
//  Created by Dulio Denis on 9/10/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit
import MobileCoreServices

class MediaPickerManager: NSObject {

    private let imagePickerController = UIImagePickerController()
    private let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
        super.init()
        
        // imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePickerController.sourceType = .Camera
            imagePickerController.cameraDevice = .Front
        } else {
            imagePickerController.sourceType = .PhotoLibrary
        }
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
    }
    
    func presentImagePickerController(animated animated: Bool) {
        presentingViewController.presentViewController(imagePickerController, animated: animated, completion: nil)
    }
    
    func dismissImagePickerController(animated animated: Bool, completion: (() -> Void)) {
        imagePickerController.dismissViewControllerAnimated(animated, completion: completion)
    }
}
