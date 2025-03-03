//
//  HomeController.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 05.02.25.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    fileprivate func configureUI() {
//        collection.backgroundColor = .yellow
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
    }
    
    fileprivate func configureViewModel() {
        viewModel.getAllData()
        viewModel.errorHandling = { error in
            
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
   
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let model = viewModel.movieItems[indexPath.row]
        cell.configure(title:model.title, data: model.items)
        cell.seeAllCallback = {
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(SeeAllController.self)") as! SeeAllController
            controller.movies = self.viewModel.movieItems[indexPath.item].items
            self.navigationController?.show(controller, sender: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 320)
    }
    
    
}
