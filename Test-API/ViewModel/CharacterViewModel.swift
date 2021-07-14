//
//  CharacterViewModel.swift
//  Test-API
//
//  Created by phamtu on 09/07/2021.
//

import Foundation


class CharacterViewModel {
    
    private var usecharacter : [Userinfor] = []
    private var service = Service()
    var reloadTable : ( () -> Void)?
    
    func requestCharacter() {
        service.getAllCharacter(endPoint: "character")
        // call back when response
        service.reloadTable = { [weak self] usedinforlist in
            self?.usecharacter = usedinforlist
            self?.reloadTable?()
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return usecharacter.count
    }

    func cellForRowAt(indexPath: IndexPath) -> Userinfor {
        return usecharacter[indexPath.row]
    }
    
    func didSelectRowat (indexPath : IndexPath) {
        
    }
  
}

