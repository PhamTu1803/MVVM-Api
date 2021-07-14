//
//  CharacterViewCell.swift
//  Test-API
//
//  Created by phamtu on 13/07/2021.
//

import UIKit
import Kingfisher
class CharacterViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblspecies: UILabel!
    @IBOutlet weak var lblstatus: UILabel!
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
    //MARK:-bindData
    func bindData(character: Userinfor) {
        lblname.text = "Name : " + character.name!
        lblstatus.text = "Status : " + character.status!
        lblspecies.text = "Species : " + character.species!
        if let url = URL(string: character.image ?? ""){
            let processor = DownsamplingImageProcessor(size: img.bounds.size)
                |> RoundCornerImageProcessor(cornerRadius: 20)

            img.kf.indicatorType = .activity
            img.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
        }
    }

}
