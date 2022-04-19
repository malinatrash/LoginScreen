//
//  ViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 19.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
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
        
    }
    
}

