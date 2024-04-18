//
//  PersonViewModel.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class PersonViewModel {
    
    // MARK: - Variables
    
    var onDataUpdated: (()->Void)?
    private var headers: [Character] = [] {
        didSet {
            self.onDataUpdated?()
        }
    }
    
    private var results: [ResultModel]?
    private var filteredResults: [ResultModel]?

    private let personDetailsViewModel: PersonDetailsViewModel
    private var imageUrls: [URL] = []
    
    init() {
        self.headers = Array()
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
        filteredResults = results?.filter { $0.name.first.hasPrefix(prefix) }
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
    
    func getPersonDetailViewModel() -> PersonDetailsViewModel {
        personDetailsViewModel
    }
}
