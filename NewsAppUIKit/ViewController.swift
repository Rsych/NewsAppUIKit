//
//  ViewController.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NetworkManager.shared.getNews { (news) in
            guard let news = news else { return }
            print(news[0].title)

        }
    }


}

