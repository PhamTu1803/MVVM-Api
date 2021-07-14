//
//  ViewController.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    private var characterModel = CharacterViewModel()
    private var locationModel = LocationViewModel()
    private var episodeModel = EpisodeViewModel()
    
    @IBOutlet weak var choisesegment: UISegmentedControl!
    @IBOutlet weak var clvdata: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initColectionView()
        self.bindViewModel()
    }
    //MARK:-initTableView
    private func initColectionView() {
        clvdata.register(UINib(nibName: "CharacterViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterViewCell")
        clvdata.register(UINib(nibName: "LocationViewCell", bundle: nil), forCellWithReuseIdentifier: "LocationViewCell")
        clvdata.delegate = self
        clvdata.dataSource = self
    }
    //MARK:-BindViewModel
    private func bindViewModel() {
        characterModel = CharacterViewModel()
        characterModel.reloadTable = { [weak self] in
            self?.clvdata.reloadData()
        }
        characterModel.requestCharacter()
    }
    //MARK: - Segmentcontroll
    @IBAction func segmentcontroll(_ sender: UISegmentedControl) {
        if choisesegment.selectedSegmentIndex == 0 {
            characterModel = CharacterViewModel()
            characterModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            characterModel.requestCharacter()
        }
        if choisesegment.selectedSegmentIndex == 1 {
            locationModel = LocationViewModel()
            locationModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            locationModel.requestLocation()
        }
        else if choisesegment.selectedSegmentIndex == 2 {
            episodeModel = EpisodeViewModel()
            episodeModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            episodeModel.requestEpisode()
        }
    }
}
//MARK:- Extention
extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterModel.numberOfRowsInSection(section : section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as! CharacterViewCell
        cell.bindData(character : characterModel.cellForRowAt(indexPath: indexPath))
        if choisesegment.selectedSegmentIndex == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationViewCell", for: indexPath) as! LocationViewCell
            cell.bindLocation(character : locationModel.cellForRowAt(indexPath: indexPath))
            return cell
        }
        if choisesegment.selectedSegmentIndex == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationViewCell", for: indexPath) as! LocationViewCell
            cell.bindEpisode(character : episodeModel.cellForRowAt(indexPath: indexPath))
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if choisesegment.selectedSegmentIndex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as! CharacterViewCell
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "inforViewController") as! inforViewController
            cell.bindData(character: characterModel.cellForRowAt(indexPath: indexPath))
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clvdata.bounds.width / 2 - 10 , height: clvdata.bounds.height / 4  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
