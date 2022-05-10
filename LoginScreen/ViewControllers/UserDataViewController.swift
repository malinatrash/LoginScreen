//
//  UserDataViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 10.05.2022.
//

import UIKit

class UserDataViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userProfilePhotoUIImage: UIImageView!
    
    // MARK: - Public properties
    var describe: String!
    var userProfilePhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors =
        [
            UIColor.systemPink.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        backgroundView.layer.addSublayer(gradient)

        descriptionLabel.text = describe
        userProfilePhotoUIImage.image = userProfilePhoto
        userProfilePhotoUIImage.layer.cornerRadius = userProfilePhotoUIImage.frame.height / 2
        userProfilePhotoUIImage.clipsToBounds = true
        userProfilePhotoUIImage.layer.borderWidth = 2
    }
    
    
    

}
