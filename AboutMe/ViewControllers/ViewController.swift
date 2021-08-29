//
//  ViewController.swift
//  AboutMe
//
//  Created by Mary Jane on 29.08.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let user = User.getUser()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            }
            else {
                if let navigationVC = viewController as? UINavigationController {
                    let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
                    aboutUserVC.title = "\(user.person.name) \(user.person.surname)"
                    aboutUserVC.user = user
                    
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInButtonPressed() {
        if usernameTextField.text != user.username || passwordTextField.text != user.password {
            showAlert(title: "authentication error", message: "Wring username or passoword!")
            passwordTextField.text = ""
        }
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        showAlert(title: "Username reminder", message: "Your username is \(user.username)" )
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Password reminder", message: "Your password is \(user.password)" )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
}

// MARK: - Private Methods
extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
