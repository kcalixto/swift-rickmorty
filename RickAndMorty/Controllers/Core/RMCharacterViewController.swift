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
        
        RMService.shared.execute(.listCharactersRequest, expecting: String.self) { result in
            switch result{
            case .success(let model):
                print(String(describing: model))
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}
