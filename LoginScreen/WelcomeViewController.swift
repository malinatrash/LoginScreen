//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 20.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        backgroundView.layer.addSublayer(gradient)
        
        userNameLabel.text = username
    }
    
    
    

}
