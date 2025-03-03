//
//  ActorController.swift
//  TheMovieApp
//
//  Created by Gul Kzm on 16.02.25.
//

import UIKit

class ActorController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ActorViewModel()
    
    //Pull to refresh
    //Pagination
    //Github PR
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        navigationItem.title = "Actor List"
        
        //refreshControl action
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        collection.refreshControl = refreshControl
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
    }
    func configureViewModel() {
        viewModel.getActorList()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
            self.refreshControl.endRefreshing()
        }
        viewModel.success = {
            self.collection.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        collection.reloadData()
        viewModel.getActorList()
    }
}

extension ActorController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        cell.configure(data: viewModel.items[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.pagination(index: indexPath.item)
    }
}
