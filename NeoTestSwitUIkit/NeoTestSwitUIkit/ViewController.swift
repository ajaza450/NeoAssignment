//
//  ViewController.swift
//  NeoTestSwitUIkit
//
//  Created by EZAZ AHAMD on 18/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollViewIB: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarContainer: UIStackView!
    @IBOutlet weak var myPageControler: UIPageControl!
    @IBOutlet weak var fabButton: UIButton!
    private var isSearchBarPinned = false
    
    
    private var currentPage: Int = 0 // Track current page
    private var viewModel = ItemViewModel()
    
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetUp()
        
    }
    
    // MARK: - view Seup

    
    fileprivate func viewSetUp() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        myPageControler.numberOfPages = viewModel.images.count
        myPageControler.currentPage = currentPage
        scrollViewIB.delegate = self
        floatingButtonSetUp()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - FloatingButton Seup

    fileprivate func floatingButtonSetUp() {
        // FAB styling
        fabButton.layer.cornerRadius = fabButton.frame.height / 2
        fabButton.layer.shadowColor = UIColor.black.cgColor
        fabButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        fabButton.layer.shadowOpacity = 0.3
        fabButton.layer.shadowRadius = 5
    }
    
    // MARK: - FloatingButton Click and Open Bottom Sheet
    
    @IBAction func fabButtonTapped(_ sender: UIButton) {
      
        let bottomSheetVC = BottomSheetViewController(nibName: "BottomSheetViewController", bundle: nil)
        bottomSheetVC.statistics = viewModel.generateStatistics()
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(bottomSheetVC, animated: true)
        
    }
    
    
    
}

// MARK: - List Item TableView

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfFilteredItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else {return UITableViewCell()}
        cell.itemInfo = viewModel.getItem(at: indexPath.row)
        return cell
    }
    
    
    
}

// MARK: - Image Carousel CollectionView

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else {return UICollectionViewCell()}
        cell.imageData = viewModel.images[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // No spacing between pages
    }
    
    
    
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.frame.width
        currentPage = Int(scrollView.contentOffset.x / pageWidth)
        myPageControler.currentPage = currentPage
        // print("Current Page: \(currentPage)")
    }
}


// MARK: - SearchBar Setup and Deletgates


extension ViewController : UISearchBarDelegate {
   
    // MARK: - pinSearchBar setup
    private func pinSearchBar() {
        isSearchBarPinned = true
        searchBarContainer.removeFromSuperview()
        view.addSubview(searchBarContainer)
        searchBarContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBarContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBarContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    
    // MARK: - unpinSearchBar setup
    private func unpinSearchBar() {
        isSearchBarPinned = false
        searchBarContainer.removeFromSuperview()
        stackView.insertArrangedSubview(searchBarContainer, at: 2)
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filteredItems(searchText: searchText)
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchBar.resignFirstResponder()
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == self.scrollViewIB else { return }
        
        let offsetY = scrollView.contentOffset.y
        let searchBarPosition = searchBarContainer.frame.origin.y
        
        if offsetY >= searchBarPosition && !isSearchBarPinned {
            // Pin the Search Bar
            pinSearchBar()
        } else if offsetY < searchBarPosition && isSearchBarPinned {
            // Restore Search Bar
            unpinSearchBar()
        }
    }
    
    //// MARK: - SearchBar Resign
    @objc func handleTap(sender: UITapGestureRecognizer) {
        searchBar.resignFirstResponder()
    }
}






extension ViewController {
    
    
}
