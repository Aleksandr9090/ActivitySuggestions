//
//  ViewController.swift
//  ActivitySuggestions
//
//  Created by Aleksandr on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var activityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewActivity()
    }

    @IBAction func suggestionButtonPressed() {
        getNewActivity()
    }
    
    private func getNewActivity() {
        NetworkManager.shared.fetchActivity(from: Link.ActivitySuggestionsLink.rawValue) { result in
            switch result {
            case .success(let activity):
                self.activityLabel.text = activity.description
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}


