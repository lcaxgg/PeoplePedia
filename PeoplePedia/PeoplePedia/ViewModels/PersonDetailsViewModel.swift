//
//  PersonDetailsViewModel.swift
//  PeoplePedia
//
//  Created by j8bok on 4/15/24.
//

import Foundation

class PersonDetailsViewModel {
    
    // MARK: - Variables
    
    private var details: ResultModel? {
        didSet {
            values.removeAll()
            
            if let firstName = details?.name.first {
                values.append(firstName)
            }
            
            if let lastName = details?.name.last {
                values.append(lastName)
            }
            
            if let birthDate = details?.dob.date {
                let formattedValues = DateHelper.formatDate(from: birthDate)
               
                if let formattedBirthDate = formattedValues.first, 
                    let age = formattedValues.last {
                    
                    values.append(formattedBirthDate)
                    values.append(age)
                }
            }
            
            if let email = details?.email {
                values.append(email)
            }
            
            if let phone = details?.phone {
                values.append(phone)
            }
            
            if let streetNumber = details?.location.street.number,
               let streetName = details?.location.street.name,
               let city = details?.location.city,
               let state = details?.location.state,
               let country = details?.location.country {
                
                let street = String(streetNumber) + " " + streetName
                let cityState = city + ", " + state
                let countryPost = country
                
                let address = street + ", " + cityState + ", " + countryPost
                values.append(address)
            }
            
            values.append("N/A")
            values.append("N/A")
        }
    }
    
    private var headers: [String]
    private var titles: [String]
    private var values: [String]
    
    init() {
        self.headers = ["Details", "Contact", "Location", "Contact Person"]
        self.titles = ["First Name", "Last Name", "Birthday",
                       "Age", "Email address", "Phone Number",
                       "Address", "Name"]
        
        self.values = Array()
    }
}

extension PersonDetailsViewModel {
   
    // MARK: - Setter
    
    func setDetails(with selectedDetails: ResultModel?) {
        details = selectedDetails
    }
    
    // MARK: - Getter
    
    func getDetails() -> ResultModel {
        details!
    }
    
    func getHeaders() -> [String] {
        headers
    }
    
    func getTitles() -> [String] {
        titles
    }
    
    func getHeader(of section: Int) -> String {
        headers[section]
    }
    
    func getTitle(of section: Int, and row: Int) -> String {
        guard let headerEnum = PersonDetailsHeaderEnum(rawValue: section) else {
            return String()
        }
        
        var title = String()
        
        switch headerEnum {
        case .about:
            let titles = Array(titles[0...3])
            title = titles[row]
        case .contact:
            let titles = Array(titles[4...5])
            title = titles[row]
        case .location:
            title = titles[6]
        case .contactPerson:
            if row == 0 {
                title = titles[7]
            } else {
                title = titles[5]
            }
        }
        
        return title
    }
    
    func getValue(of section: Int, and row: Int) -> String {
        guard let headerEnum = PersonDetailsHeaderEnum(rawValue: section) else {
            return String()
        }
        
        var value = String()
        
        switch headerEnum {
        case .about:
            let values = Array(values[0...3])
            value = values[row]
        case .contact:
            let values = Array(values[4...5])
            value = values[row]
        case .location:
            value = values[6]
        case .contactPerson:
            value = values[7]
        }
        
        return value
    }
    
    func getImageUrl() -> String {
        details?.picture.large ?? String()
    }
}


