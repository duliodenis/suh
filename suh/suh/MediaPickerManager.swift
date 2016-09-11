//
//  MediaPickerManager.swift
//  suh
//
//  Created by Dulio Denis on 9/10/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit
import MobileCoreServices


// mechanism to pass the image regardless which object works with it
// restricted to only working with Classes in order to define the delegate as a weak reference
protocol MediaPickerManagerDelegate: class {
    
    func mediaPickerManager(manager: MediaPickerManager, didFinishPickingImage image: UIImage)
    
}


class MediaPickerManager: NSObject {

    private let imagePickerController = UIImagePickerController()
    private let presentingViewController: UIViewController
    
    weak var delegate: MediaPickerManagerDelegate?
    
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


// MARK: - imagePickerController Method

extension MediaPickerManager: UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.mediaPickerManager(self, didFinishPickingImage: image)
    }    
}


