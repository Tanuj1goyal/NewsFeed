//
//  Utility.swift
//  NewsFeed
//
//  Created by Tanuj on 19/02/21.
//

import Foundation
import UIKit

/*
 This class will have the utility functions like alert
 */

struct Utility {
    // Show UIAlertController with title, message
    static func showAlert(with title: String, message: String, actions: [UIAlertAction]? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions?.forEach { action in
            alertController.addAction(action)
        }
        UIApplication.topViewController()?.present(alertController, animated: true)
    }
}
