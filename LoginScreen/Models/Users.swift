//
//  Users.swift
//  LoginScreen
//
//  Created by Pavel Naumov on 10.05.2022.
//

import Darwin
import UIKit

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "user",
            password: "password",
            person: Person(
                name: "Pavel",
                surname: "Naumov",
                profilePhoto: UIImage(named: "avatar.jpeg"),
                description: "Меня зовут Павел, но друзья меня зовут играть на гитарах. Я учусь на первом курсе вуза своего города на IT-направлении. Очень люблю играть на гитарах, которые я любезно обменял у своего друга на PS4. Мечтаю о создании приложений на IOS с самым красивым интерфейсом, потому что я знаю, что хороший внешний вид приложения притягивает пользователя!"
            )
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let profilePhoto: UIImage!
    let description: String
}
