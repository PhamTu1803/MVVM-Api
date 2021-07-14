//
//  Service.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import Foundation
import Alamofire

//https://rickandmortyapi.com/api/character
//https://rickandmortyapi.com/api/location
//https://rickandmortyapi.com/api/episode

class Service {
    
    static let base_Url : String = "https://rickandmortyapi.com/api/"
    var reloadTable : (([Userinfor])-> Void)?
    var reloadlocation : (([UserLocation])-> Void)?
    var reloadepisode : (([UserEpisode])-> Void)?
    //MARK: - Function getAllAPI
    func getAllCharacter(endPoint : String) {
        AF.request(Service.base_Url + endPoint , method: .get , parameters: nil, encoding: URLEncoding.default  , headers: nil, interceptor: nil ).response { [weak self]
            (responseData) in
            guard let strongSelf = self ,
                  let data = responseData.data else { return }
            do {
                let character  = try JSONDecoder().decode(CharacterModel.self, from: data)
                print(character)
                if let usedinforlist = character.results {
                    strongSelf.reloadTable?(usedinforlist)
                }
                let location  = try JSONDecoder().decode(LocationModel.self, from: data)
                if let usedlocation = location.results {
                    strongSelf.reloadlocation?(usedlocation)
                }
                let episode  = try JSONDecoder().decode(EpisodeModel.self, from: data)
                if let usedepisode = episode.results {
                    strongSelf.reloadepisode?(usedepisode)
                }
            } catch {
                print("Error\(error)")
            }

        }
    }
 
    
}
