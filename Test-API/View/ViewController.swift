//
//  ViewController.swift
//  Test-API
//
//  Created by phamtu on 07/07/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var choisesegment: UISegmentedControl!
    @IBOutlet weak var clvdata: UICollectionView!
    
    private var characterViewModel = CharacterViewModel()
    private var locationViewModel = LocationViewModel()
    private var episodeViewModel = EpisodeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initColectionView()
        self.bindViewModel()
    }
    //MARK: - initTableView
    private func initColectionView() {
        clvdata.register(UINib(nibName: "CharacterViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterViewCell")
        clvdata.register(UINib(nibName: "LocationViewCell", bundle: nil), forCellWithReuseIdentifier: "LocationViewCell")
        clvdata.delegate = self
        clvdata.dataSource = self
    }
    
    //MARK: - BindViewModel
    private func bindViewModel() {
        characterViewModel = CharacterViewModel() //?? khoi tao roi lai khoi tao lai lan nua lam gi do. thcode q
        characterViewModel.reloadTable = { [weak self] in
            self?.clvdata.reloadData()
        }
        characterViewModel.requestCharacter()
    }
    //MARK: - Segmentcontroll
    @IBAction func segmentcontroll(_ sender: UISegmentedControl) {
        if choisesegment.selectedSegmentIndex == 0 {
            characterViewModel = CharacterViewModel()
            characterViewModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            characterViewModel.requestCharacter()
        }
        if choisesegment.selectedSegmentIndex == 1 {
            locationViewModel = LocationViewModel()
            locationViewModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            locationViewModel.requestLocation()
        }
        else if choisesegment.selectedSegmentIndex == 2 {
            episodeViewModel = EpisodeViewModel()
            episodeViewModel.reloadTable = { [weak self] in
                self?.clvdata.reloadData()
            }
            episodeViewModel.requestEpisode()
        }
    }
}
//MARK:- Extention
extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.numberOfRowsInSection(section : section)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as! CharacterViewCell
        cell.bindData(character : characterViewModel.cellForRowAt(indexPath: indexPath))
        if choisesegment.selectedSegmentIndex == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationViewCell", for: indexPath) as! LocationViewCell
            cell.bindLocation(character : locationViewModel.cellForRowAt(indexPath: indexPath))
            return cell
        }
        if choisesegment.selectedSegmentIndex == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationViewCell", for: indexPath) as! LocationViewCell
            cell.bindEpisode(character : episodeViewModel.cellForRowAt(indexPath: indexPath))
            return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if choisesegment.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "InforViewController") as! InforViewController
            viewController.bindData(character: characterViewModel.cellForRowAt(indexPath: indexPath))
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clvdata.bounds.width / 2 - 10 , height: clvdata.bounds.height / 4  )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
