//
//  LocationModel.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import UIKit
import Alamofire

struct LocationModel : Codable {
    let infor : String?
    let results : [UserLocation]?
}
struct UserLocation : Codable {
    let id : Int?
    let name : String?
    let type : String?
    let dimension : String?

}
