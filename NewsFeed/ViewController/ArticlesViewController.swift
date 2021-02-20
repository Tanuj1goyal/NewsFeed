//
//  ViewController.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    @IBOutlet weak var tableViewArticles: UITableView!
    
    private let viewModel = ArticlesViewModel()
    private let cellIdentifier = "cellAtricle"  // Cell Row Identifier for uitableview
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startLoader()
        //Register table view cell
        tableViewArticles.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        viewModel.delegate = self
        viewModel.getNewsFeed()
    }
}

// MARK:- UITableView Delegate & DataSource
extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ArticlesTableViewCell {
            cell.result = viewModel.articles?.results?[indexPath.row]
            cell.setupCell()
            return cell
        }
        return UITableViewCell()
    }
}

// MARK:- Articles ViewModel Delegate
extension ArticlesViewController: ArticlesViewModelDelegate {
    func articlesFetched() {
        stopLoader()
        tableViewArticles.reloadData()
    }
}
