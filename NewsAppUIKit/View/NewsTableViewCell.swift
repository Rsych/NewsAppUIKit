//
//  NewsTableViewCell.swift
//  NewsAppUIKit
//
//  Created by Ryan J. W. Kim on 2022/04/12.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    var articleVM: ArticleViewModel? {
        didSet {
            if let articleVM = articleVM {
                titleLabel.text = articleVM.title
                NetworkManager.shared.getImage(urlString: articleVM.urlToImage) { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.articleImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    var articleImageData: Data? {
        didSet {
            if let data = articleImageData {
                articleImage.image = UIImage(data: data)
            }
        }
    }
    
    private lazy var articleImage: ShadowImageView = {
        let v = ShadowImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(articleImage)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // article image
        NSLayoutConstraint.activate([
            articleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            articleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            articleImage.topAnchor.constraint(equalTo: topAnchor),
            articleImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
