//
//  ArticlesTableViewCell.swift
//  NewsFeed
//
//  Created by Tanuj on 18/02/21.
//

import UIKit
import Kingfisher

/*
 1. This class will act as Subclass of UITableViewCell
 2. Role of this class is to create Cell Row objects
 */

class ArticlesTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblDate: UILabel!
    
    var result: Results?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        guard let result = result else { return }
        lblTitle.text = result.title
        lblAuthor.text = result.byline
        lblDate.text = result.published_date
        if let imgUrl = result.media?.first?.mediaMetadata?.first?.url {
            imgLogo.kf.setImage(with: URL(string: imgUrl)!)
        }
    }
}
