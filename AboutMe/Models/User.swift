//
//  User.swift
//  AboutMe
//
//  Created by Mary Jane on 29.08.2021.
//

struct User {
    let username: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(username: "User",
             password: "12345",
             person: Person(name: "Maria",
                            surname: "Karpukhina",
                            hobbies: [.driving, .walking, .traveling],
                            residence: "Saint-Petersburg",
                            cityOfBirth: "Moscow",
                            additionalInformation: "I have my lovely red MINI Cooper and I am a member of MINI club community, what is the most active and fun community in the world!"))
    }
}

struct Person {
    let name: String
    let surname: String
    let hobbies:[Hobbies]
    let residence: String
    let cityOfBirth: String
    let additionalInformation: String
}

enum Hobbies: String {
    case driving = "driving a car"
    case read = "reading the books"
    case walking = "walking everywhere"
    case traveling = "travel the world"
}
