//
//  inforViewController.swift
//  Test-API
//
//  Created by phamtu on 14/07/2021.
//

import UIKit
import Kingfisher

// final dau?toi chua chinh
class InforViewController: UIViewController {
    
    var name : String = ""
    var status : String = ""
    var gender : String = ""
    var species : String = ""
    var image : String = ""
    
    @IBOutlet weak var genderlbl: UILabel!
    @IBOutlet weak var specieslbl: UILabel!
    @IBOutlet weak var statuslbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.namelbl.text = name
        self.statuslbl.text = status
        self.specieslbl.text = species
        self.genderlbl.text = gender
        if let url = URL(string: image ?? ""){
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
    
    public func bindData(character: Userinfor) {
        if let image = character.image , let name = character.name, let status = character.status, let gender = character.gender , let species = character.species {
            self.image = image
            self.name = "Name : " + name
            self.status = "Status : " + status
            self.gender = "Gender : " + gender
            self.species = "Species : " + species
        }
        
    }
}

extension UIViewController {
    static func initFromNib() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }
        return instanceFromNib()
    }
}
