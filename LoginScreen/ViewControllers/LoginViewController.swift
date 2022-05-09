//
//  ViewController.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 19.04.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let user = User.getUserData()
    
//    private let userName = "username"
//    private let password = "password"
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = "\(user.person.name ) \(user.person.surname)"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(title: "You forgot user name?", message: "Your user name: user!")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "You forgot password?", message: "Your user password: password!")
    }
    
    @IBAction func loginButtonPressed() {
        if userNameTF.text != user.login || passwordTF.text != user.password {
            showAlert(title: "Wrong username or password", message: "Please, try again")
        } else {
            performSegue(withIdentifier: "goToWelcomeScreen", sender: self)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true)
    }
}
