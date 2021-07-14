//
//  LocationViewCell.swift
//  Test-API
//
//  Created by phamtu on 14/07/2021.
//

import UIKit

class LocationViewCell: UICollectionViewCell {

    @IBOutlet weak var dimentionlb: UILabel!
    @IBOutlet weak var typelb: UILabel!
    @IBOutlet weak var namelb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    func bindLocation(character: UserLocation) {
        namelb.text = "Name : " + character.name!
        typelb.text = "Status : " + character.type!
        dimentionlb.text = "Dimention : " + String("\(character.dimension!)")
    }
    func bindEpisode(character: UserEpisode) {
        namelb.text = "Name : " + character.name!
        typelb.text = "Air Date : " + character.air_date!
        dimentionlb.text = "Episode : " + character.episode!
    }
}
