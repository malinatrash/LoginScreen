//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 20.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    // MARK: - Public properties
    var name: String!
    
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
        userNameLabel.text = name
    }
}
