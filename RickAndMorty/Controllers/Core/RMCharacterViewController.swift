//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Kaua Calixto on 02/09/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            pathComponents: ["1"],
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(
            request,
            expecting: RMCharacter.self
        ) { result in
            switch result{
            case .success:
                break
            case .failure(let error):
                    print(String(describing: error))
            }

        }
    }
}
