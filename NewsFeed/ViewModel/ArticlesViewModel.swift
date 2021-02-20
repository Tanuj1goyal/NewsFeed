//
//  NewsFeedViewModel.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation
import UIKit

protocol ArticlesViewModelDelegate: class {
    func articlesFetched()
}
class ArticlesViewModel {
    weak var delegate: ArticlesViewModelDelegate?
    var articles: Articles?
    
    // MARK:- API Call Get all articles
    func getNewsFeed() {
        MostViewedAPIService.instance.fetchMostViewedFeeds { (result) in
            switch result {
            case .success(let data):
                let mappedModel = try? JSONDecoder().decode(Articles.self, from: data)
                print(mappedModel ?? "No result")
                self.articles = mappedModel
            case .failure(let error):
                print(error.description)
                Utility.showAlert(with: "Error", message: error.description, actions: [UIAlertAction(title: "OK", style: .default, handler: nil)])
            }
            self.delegate?.articlesFetched()
        }
    }
}
