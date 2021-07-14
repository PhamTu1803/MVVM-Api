//
//  CharacterModel.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import UIKit
import Alamofire

struct CharacterModel : Codable {
    let infor : String?
    let results : [Userinfor]?
}
struct Userinfor : Codable {
    let id : Int?
    let name : String?
    let status : String?
    let species : String?
    let image : String?
    let location : Location1?
    let gender : String?

}
struct Location1 : Codable {
    let name : String?
    let url : String?
}
