//
//  User.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 19/02/24.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastname = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins =  true
    var fewquentRefills =  false
}
