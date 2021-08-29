//
//  AboutMeViewController.swift
//  AboutMe
//
//  Created by Mary Jane on 30.08.2021.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var aboutMeLabel: UILabel!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = getAboutInfo()
    }
    
    private func getAboutInfo() -> String {
        "Hi! My name is \(user.person.name).\nI'm from \(user.person.cityOfBirth).\nI'm living in \(user.person.residence) currently.\nMy hobbies are: \(getHobbies()).(user.person.additionalInformation)"
    }
    
    private func getHobbies() -> String {
        var hobbies = ""
        for hobby in user.person.hobbies {
//            hobbies += hobby.rawValue +  hobbies == "" ? hobbies : hobbies + ", "
            hobbies += hobby.rawValue + "\n"
        }
        return hobbies
    }
}
