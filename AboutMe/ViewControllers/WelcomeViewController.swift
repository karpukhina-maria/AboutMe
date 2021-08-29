//
//  WelcomeViewController.swift
//  AboutMe
//
//  Created by Mary Jane on 29.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var helloTextField: UILabel!    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloTextField.text = "\(user.person.name) \(user.person.surname)"
    }
}
