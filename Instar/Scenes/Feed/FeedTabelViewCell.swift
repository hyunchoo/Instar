//
//  FeedTabelViewCell.swift
//  Instar
//
//  Created by 🙈 🙊 on 2022/06/21.
//

import SnapKit
import UIKit



final class FeedTabelViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
       
        button.setImage(systemName: "heart")
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
       
        button.setImage(systemName: "message")
        return button
    }()
    
    private lazy var directButton: UIButton = {
        let button = UIButton()
        
        button.setImage(systemName: "paperplane")
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
       
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "추추님 외 30명이 좋아합니다."
        
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 5
        label.text = "이 편지는 영국에서 시작되어, 글을 본 10일 이내에 100곳에 글을 옮기지 않으면, 인스타그램 세상에서 행복할 수 없을지도 모른다. 이게시물의 내용을 무시하고, 옮기지 않은 사람은 그이후로 좋아요를 받지 못한다"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.text = "1일 전"
        
        return label
    }()
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directButton,
            bookmarkButton,
            currentLikedCountLabel,
            contentsLabel,
            dateLabel
        ].forEach { addSubview($0) }
        
        postImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
    
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        directButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        currentLikedCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
    }
}
