//
//  PersonDetailsViewController.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import UIKit

class PersonDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var personDetailsViewModel: PersonDetailsViewModel?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpIds()
        setUpView()
    }
    
    // MARK: - UI Setup
    
    private func setUpIds() {
        tableView.accessibilityIdentifier = "tableViewIdentifier"
    }
    
    private func setUpView() {
        customImageView.layer.cornerRadius = customImageView.frame.size.width / 2
        customImageView.clipsToBounds = true
        
        if let urlString = personDetailsViewModel?.getImageUrl() {
            DispatchQueue.main.async {
                self.customImageView.image = ImageCacheHelper.shared.getCachedImage(of: urlString)
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        personDetailsViewModel?.getHeader(of: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 1
        case 3:
            return 2
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        personDetailsViewModel?.getHeaders().count ?? 0
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  (indexPath.section == 1 && indexPath.row == 0) || indexPath.section == 2 {
            return UITableView.automaticDimension
        }
        
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonDetailsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: PersonDetailsTableViewCell.getCellIdentifier()) as! PersonDetailsTableViewCell
        
        cell.indexPath = indexPath
        cell.personDetailsViewModel = personDetailsViewModel!
        cell.setUpCell()
        cell.selectionStyle = .none
        
        return cell
    }
}
