//
//  PersonDetailsTableViewCell.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import UIKit

class PersonDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!
    
    var indexPath: IndexPath = IndexPath()
    var personDetailsViewModel: PersonDetailsViewModel = PersonDetailsViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func getCellIdentifier() -> String {
        "personDetailsCellIdentifier"
    }
    
    // MARK: - UI Setup
    
    func setUpCell() {
        setUpTitle()
        setUpValue()
    }
    
    private func setUpTitle() {
        title.text = personDetailsViewModel.getTitle(of: indexPath.section, and: indexPath.row)
    }
    
    private func setUpValue() {
        value.text = personDetailsViewModel.getValue(of: indexPath.section, and: indexPath.row)
    }
}
