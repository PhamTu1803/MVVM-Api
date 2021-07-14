//
//  EpisodeViewModel.swift
//  Test-API
//
//  Created by phamtu on 14/07/2021.
//

import Foundation

class EpisodeViewModel {
    private var userepisode : [UserEpisode] = []
    private var service = Service()
    var reloadTable : ( () -> Void)?
    
    func requestEpisode() {
        service.getAllCharacter(endPoint: "episode")
        // call back when response
        service.reloadepisode = { [weak self] usedepisode in
            self?.userepisode = usedepisode
            self?.reloadTable?()
        }
    }

    
    func numberOfRowsInSection(section: Int) -> Int {
        return userepisode.count
    }

    func cellForRowAt(indexPath: IndexPath) -> UserEpisode {
        return userepisode[indexPath.row]
    }
}
