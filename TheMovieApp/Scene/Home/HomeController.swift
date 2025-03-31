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
    
    func showMovieDetail(movie: MovieResult) {
//        let controller = storyboard?.instantiateViewController(withIdentifier: "\(MovieDetailController.self)") as! MovieDetailController
//        controller.selectedMovie = movie
//        navigationController?.show(controller, sender: nil)
        let coordinator = MovieDetailCoordinator(movie: movie,
                                                 navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
   
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.movieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let model = viewModel.movieItems[indexPath.row]
        cell.configure(title: model.title.type.rawValue, data: model.items)
        cell.seeAllCallback = {
//            guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(SeeAllController.self)") as! SeeAllController else { return }
            let controller = SeeAllController(viewModel: .init(model: model, usecase: self.viewModel.manager))
//            controller.movies = self.viewModel.movieItems[indexPath.item].items
            self.navigationController?.show(controller, sender: nil)
        }
        cell.didMovieSelected = { selectedMovie in
            self.showMovieDetail(movie: selectedMovie)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 320)
    }
    
    
}
