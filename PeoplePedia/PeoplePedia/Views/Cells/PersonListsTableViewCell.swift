//
//  PersonListsTableViewCell.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import UIKit

class PersonListsTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var location: UILabel!

    var resultModel: ResultModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customImageView.layer.cornerRadius = customImageView.frame.size.width / 2
        customImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func getCellIdentifier() -> String {
        "personListsCellIdentifier"
    }
    
    // MARK: - UI Setup
    
   func setUpCell() {
       if let urlString = resultModel?.picture.large {
           self.customImageView.image = ImageCacheHelper.shared.getCachedImage(of: urlString)
       }
       
       if let first = resultModel?.name.first, let last = resultModel?.name.last {
           fullName.text = first + ", " + last
       }
      
       if let city = resultModel?.location.city, let country = resultModel?.location.country {
           location.text = city + ", " + country
       }
    }
}
