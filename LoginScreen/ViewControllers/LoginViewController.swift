//
//  ViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 19.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Private properties
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor.red.cgColor,
            UIColor.purple.cgColor,
            UIColor.cyan.cgColor
        ]
        backgroundView.layer.addSublayer(gradient)
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = "\(user.person.name) \(user.person.surname)"
            } else if let navigationVC = viewController as? UINavigationController {
                let userDataVC = navigationVC.topViewController as! UserDataViewController
                userDataVC.describe = user.person.description
                userDataVC.userProfilePhoto = UIImage(named: user.person.profilePhoto)
                userDataVC.title = "\(user.person.name) \(user.person.surname)"
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(title: "You forgot user name?", message: "Your user name: \(user.login)!")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "You forgot password?", message: "Your user password: \(user.password)!")
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user.login || passwordTF.text != user.password {
            showAlert(title: "Wrong username or password", message: "Please, try again")
        } else {
            performSegue(withIdentifier: "goToWelcomeScreen", sender: self)
        }
    }
    
    // MARK: - Public method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
    // MARK: - Private method
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true)
    }
}
