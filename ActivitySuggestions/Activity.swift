//
//  Activity.swift
//  ActivitySuggestions
//
//  Created by Aleksandr on 12.04.2022.
//

import Foundation

struct Activity: Decodable {
    
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
    
    var description: String {
        """
    Activity: \(activity)
    Type: \(type)
    Participants: \(participants)
    Price: \(price)
    Link: \(link)
    Key: \(key)
    Accessibility: \(accessibility)
    """
    }
}

enum Link: String {
    case ActivitySuggestionsLink = "https://www.boredapi.com/api/activity"
}




