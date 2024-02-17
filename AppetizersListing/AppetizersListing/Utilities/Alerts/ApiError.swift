//
//  ApiError.swift
//  AppetizersListing
//
//  Created by Macbook Air  on 13/02/24.
//

import Foundation


enum ApiError: Error{
    case invalidUrl
    case invalidResponse
    case invalidData
    case unableToComplete
}
