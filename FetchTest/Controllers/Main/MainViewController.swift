//
//  MainViewController.swift
//  FetchTest
//
//  Created by Valentyn Khimchuk on 10/24/24.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func showError(errorType: APIError)
}

class MainViewController: UIViewController, AlertPresentableVC {
    // MARK: - Outlets
    @IBOutlet private weak var recipesCollectionView: UICollectionView!
    
    // MARK: - IdGuardTableViewDataSourceAdapter
    private var collectionViewAdapter: RecipesCollectionViewDataSource?
    
    // MARK: - PhotoListViewControllerDelegate
    weak var delegate: MainViewControllerDelegate?
    
    // MARK: - PhotoListViewModel
    var viewModel: MainViewModel?
    
    // MARK: - Pull to Refresh
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationView()
        configureCollectionView()
        viewModel?.getImages()
        configurePullToRefresh()
    }
    
    // MARK: - Private methods
    private func configureNavigationView() {
        title = "Recipies"
        
        let refreshButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(handleRefresh)
        )
        
        navigationItem.rightBarButtonItem = refreshButton
    }
    
    private func configureCollectionView() {
        collectionViewAdapter = RecipesCollectionViewDataSourceAdapter()
        collectionViewAdapter?.configure(with: recipesCollectionView)
    }
    
    private func configurePullToRefresh() {
        recipesCollectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }

    @objc private func handleRefresh() {
        viewModel?.refresh()
    }
    
    private func stopRefreshing() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}

// MARK: - PhotoListViewModelDelegate
extension MainViewController: MainViewModelDelegate {
    func updateData(dataSource: [Recipe]) {
        if dataSource.isEmpty {
            presentAlert(text: "Woops...", description: "There are no recipes for today, try again later")
        } else {
            collectionViewAdapter?.update(with: dataSource)
            recipesCollectionView.reloadData()
        }
        
        stopRefreshing()
    }
    
    func showError(errorType: APIError) {
        presentAlert(text: errorType.code.localizedTitle, description: errorType.code.localizedDescription)
    }
}

// MARK: - StoryboardController
extension MainViewController: StoryboardController {
    static var storyboard: Storyboard {
        .Main
    }
}
