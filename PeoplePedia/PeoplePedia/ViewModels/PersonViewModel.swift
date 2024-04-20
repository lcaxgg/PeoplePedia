//
//  PersonViewModel.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class PersonViewModel {
    
    // MARK: - Variables
    
    var onHeadersUpdated: (()->Void)?
    var onSearchedResultsUpdated: (()->Void)?
    
    private var results: [ResultModel]?
    private var filteredResults: [ResultModel]?
    private var headersBackUp: [Character]
    
    private var headers: [Character] = [] {
        didSet {
            self.onHeadersUpdated?()
        }
    }
        
    private var searchedResults: [ResultModel]? = [] {
        didSet {
            self.onSearchedResultsUpdated?()
        }
    }
    
    private let personDetailsViewModel: PersonDetailsViewModel
    private var imageUrls: [URL] = []
    
    init() {
        self.headers = Array()
        self.headersBackUp = Array()
        self.personDetailsViewModel = PersonDetailsViewModel()
    
        fetchData()
    }
    
    // MARK: - Methods
    
    func fetchData() {
        DispatchQueue.global(qos: .userInteractive).async {
            let urlSessionNetworkService = UrlSessionService()
            let dataHandler = DataHandler(apiClientProtocol: urlSessionNetworkService)
            
            let startTime = Date().timeIntervalSince1970
            
            dataHandler.fetchProcessedData { result in
                switch result {
                case .success(let data):
                    self.results = data.results
                    
                    var placeHolder = Set<Character>()
                    for details in data.results {
                        let name = details.name
                        let prefix = String(name.first.prefix(1))
                        
                        placeHolder.insert(Character(prefix))
                        ImageCacheHelper.shared.imageUrls.append((URL(string: details.picture.large) ?? URL(string: String()))!)
                    }
                    
                    ImageCacheHelper.shared.cacheImages()
                    
                    self.headers = placeHolder.sorted()
                    self.headersBackUp = self.headers
                    
                    let endTime = Date().timeIntervalSince1970
                    let elapsedTime = endTime - startTime
                   
                    print("Results: \(self.results?.count ?? 0) data.")
                    print("Completed fetching data. Elapsed time: \(elapsedTime.rounded())")
                case .failure(let error):
                    print("\(error)")
                }
            }
        }
     
    }
    
    func filterResults(by section: Int) {
        let prefix = String(headers[section])
        filteredResults = searchedResults?.count ?? 0 > 0 ? searchedResults : results?.filter { $0.name.first.hasPrefix(prefix) }
    }
    
    func searchResults(by searchText: String) {
        guard searchText.count != 0 else {
            headers = headersBackUp
            searchedResults = nil
            return
        }
        
        let prefix = searchText.first
        headers = headers.filter { $0 == prefix }
        
        searchedResults = Array((filteredResults?.filter {
            $0.name.first.contains(searchText) ||
            $0.name.last.contains(searchText)
        })!)
    }
}

extension PersonViewModel {
  
    // MARK: - Setter
    
    func setDetails(with row: Int) {
        personDetailsViewModel.setDetails(with: filteredResults?[row])
    }
    
    // MARK: - Getter
    
    func getResults() -> [ResultModel] {
        results ?? []
    }
    
    func getHeaders() -> [Character] {
        headers
    }
    
    func getFilteredResults() -> [ResultModel] {
        filteredResults ?? []
    }
    
    func getPersonDetailsViewModel() -> PersonDetailsViewModel {
        personDetailsViewModel
    }
}
