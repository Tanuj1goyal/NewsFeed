//
//  UIViewController+Extension.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK:- Activity Indicator
    private var activityIndicatorTag: Int { return 999999 }
    
    func startLoader(style: UIActivityIndicatorView.Style = .large, location: CGPoint? = nil) {
        let loc = location ?? self.view.center
        DispatchQueue.main.async {
            //Create the activity indicator
            let activityIndicator = UIActivityIndicatorView(style: style)
            //Add the tag so we can find the view in order to remove it later
            activityIndicator.tag = self.activityIndicatorTag
            //Set the location
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.color = .darkGray
            //Start animating and add the view
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
    
    func stopLoader() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}
