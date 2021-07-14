//
//  EpisodeModel.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import UIKit
import Alamofire

struct EpisodeModel : Codable {
    let infor : String?
    let results : [UserEpisode]?
}
struct UserEpisode : Codable {
    let id : Int?
    let name : String?
    let air_date : String?
    let episode : String?

}
