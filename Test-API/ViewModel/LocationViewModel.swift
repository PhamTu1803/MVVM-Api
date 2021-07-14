//
//  LocationViewModel.swift
//  Test-API
//
//  Created by phamtu on 14/07/2021.
//

import Foundation

class LocationViewModel {
    private var uselocation : [UserLocation] = []
    private var service = Service()
    var reloadTable : ( () -> Void)?
    
    func requestLocation() {
        service.getAllCharacter(endPoint: "location")
        // call back when response
        service.reloadlocation = { [weak self] usedlocation in
            self?.uselocation = usedlocation
            self?.reloadTable?()
        }
    }

    
    func numberOfRowsInSection(section: Int) -> Int {
        return uselocation.count
    }

    func cellForRowAt(indexPath: IndexPath) -> UserLocation {
        return uselocation[indexPath.row]
    }
}
