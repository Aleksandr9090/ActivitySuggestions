//
//  Activity.swift
//  ActivitySuggestions
//
//  Created by Aleksandr on 12.04.2022.
//

import Foundation

struct Activity: Decodable {
    
    let activity: String?
    let type: String?
    let participants: Int?
    let price: Double?
    let link: String?
    let key: String?
    let accessibility: Double?
    
    var description: String {
        """
    Activity: \(activity ?? "")
    Type: \(type ?? "")
    Participants: \(participants ?? 0)
    Price: \(price ?? 0)
    Link: \(link ?? "")
    Key: \(key ?? "")
    Accessibility: \(accessibility ?? 0)
    """
    }
    
    init(activity: String, type: String, participants: Int, price: Double, link: String, key: String, accessibility: Double) {
        self.activity = activity
        self.type = type
        self.participants = participants
        self.price = price
        self.link = link
        self.key = key
        self.accessibility = accessibility
    }
    
    init(activityData: [String: Any]) {
        activity = activityData["activity"] as? String ?? ""
        type = activityData["type"] as? String ?? ""
        participants = activityData["participants"] as? Int ?? 0
        price = activityData["price"] as? Double ?? 0
        link = activityData["link"] as? String ?? ""
        key = activityData["key"] as? String ?? ""
        accessibility = activityData["accessibility"] as? Double ?? 0
    }
    
    static func getActivity(from value: Any) -> Activity? {
        guard let activityData = value as? [String: Any] else { return nil}
        let activity = Activity(activityData: activityData)
        return activity
    }
}

enum Link: String {
    case ActivitySuggestionsLink = "https://www.boredapi.com/api/activity"
}




