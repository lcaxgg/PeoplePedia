//
//  MainViewController.swift
//  PeoplePedia
//
//  Created by j8bok on 4/13/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController: UISearchController
    private var refreshControl: UIRefreshControl
    private let personViewModel: PersonViewModel
    private let activityIndicator: UIActivityIndicatorView
    
    // MARK: - Life Cycle
    
    init(searchController: UISearchController, refreshControl: UIRefreshControl, 
         personViewModel: PersonViewModel, acitivityIndicator: UIActivityIndicatorView) {
        
        self.searchController = searchController
        self.refreshControl = refreshControl
        self.personViewModel = personViewModel
        self.activityIndicator = acitivityIndicator
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.searchController = UISearchController()
        self.refreshControl = UIRefreshControl()
        self.personViewModel = PersonViewModel()
        self.activityIndicator = UIActivityIndicatorView(style: .large)
        
        super.init(coder: coder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpIds()
        setUpNavigationItem()
        setUpView()
        handleDataUpdates()
    }
    
    // MARK: - UI Setup
    
    private func setUpIds() {
        tableView.accessibilityIdentifier = "tableViewIdentifier"
        searchController.searchBar.searchTextField.accessibilityIdentifier = "searchField"
    }
    
    private func setUpNavigationItem() {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        
        navigationItem.backBarButtonItem = backButton
        navigationItem.searchController = searchController
    }
    
    private func setUpView() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)
        
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(personViewModel.getHeaders()[section])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personViewModel.filterResults(by: section)
        let rows = personViewModel.getFilteredResults().count
        
        return rows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        personViewModel.getHeaders().count
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        20.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PersonListsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: PersonListsTableViewCell.getCellIdentifier()) as! PersonListsTableViewCell
        
        personViewModel.filterResults(by: indexPath.section)
        let filteredResults = personViewModel.getFilteredResults()
        
        cell.resultModel = filteredResults[indexPath.row]
        cell.setUpCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        personViewModel.filterResults(by: indexPath.section)
        personViewModel.setDetails(with: indexPath.row)
        
        performSegue(withIdentifier: "segueIdentifier", sender: indexPath)
    }
    
    // MARK: - Others
    
    private func handleDataUpdates() {
        self.activityIndicator.startAnimating()
        
        title = String()
        navigationItem.searchController?.searchBar.isHidden = true
        
        personViewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.title = "PeoplePedia"
                self?.navigationItem.searchController?.searchBar.isHidden = false
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
        }
    }
    
    @objc private func refreshData() {
        self.personViewModel.fetchData()
        view.isUserInteractionEnabled = false
        navigationItem.searchController?.searchBar.isUserInteractionEnabled = false
        
        personViewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.view.isUserInteractionEnabled = true
                self?.navigationItem.searchController?.searchBar.isUserInteractionEnabled = true
                
                self?.tableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueIdentifier" {
            if let detailViewController = segue.destination as? PersonDetailsViewController {
                detailViewController.personDetailsViewModel = personViewModel.getPersonDetailViewModel()
            }
        }
    }
}

