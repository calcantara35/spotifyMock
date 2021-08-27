//
//  ProfileViewController.swift
//  SpotifyMock
//
//  Created by Cesar Alcantara on 8/26/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        APICaller.shared.getCurrentUserProfile { result in
            switch result {
            case .success(let model):
                print(model)
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
