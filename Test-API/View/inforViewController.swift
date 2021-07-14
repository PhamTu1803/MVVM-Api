//
//  inforViewController.swift
//  Test-API
//
//  Created by phamtu on 14/07/2021.
//

import UIKit

class inforViewController: UIViewController {
    private var usecharacter : [Userinfor] = []
    private var service = Service()
    @IBOutlet weak var genderlbl: UILabel!
    @IBOutlet weak var specieslbl: UILabel!
    @IBOutlet weak var statuslbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getAllCharacter(endPoint: "character")
        // call back when response
        service.reloadTable = { [weak self] usedinforlist in
            self?.usecharacter = usedinforlist
        }
//        self.bindData(character: Userinfor)
    }
    func bindData(character: Userinfor) {
        self.namelbl.text = "Name : " + character.name!
        self.statuslbl.text = "Status : " + character.status!
        self.genderlbl.text = "Species : " + character.gender!
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
