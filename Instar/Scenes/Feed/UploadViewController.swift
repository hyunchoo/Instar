//
//  UploadViewController.swift
//  Instar
//
//  Created by 🙈 🙊 on 2022/06/22.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    
    private let uploadImage: UIImage
    
    private let imageView = UIImageView()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        textView.delegate = self
        
        return textView
    }()
    
    init(uploadImage: UIImage) {
    
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        setupLayout()
        
        imageView.image = uploadImage
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
}


private extension UploadViewController {
    
    func setNavigationItem () {
        navigationItem.title = "새 게시물"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapLeftButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유",
                                                            style: .plain,
                                                            target: true,
                                                            action: #selector(didTapRightButton))
        
    }
    
    @objc func didTapLeftButton() {
        dismiss(animated: true)
    }
    
    @objc func didTapRightButton() {
        dismiss(animated: true)
    }
    
    func setupLayout() {
        [imageView, textView].forEach { view.addSubview($0)}
        
        let inset: CGFloat = 16.0
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(100.0)
            $0.height.equalTo(imageView.snp.width)
        }
        
        textView.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
            $0.trailing.equalToSuperview().inset(inset)
            $0.top.equalTo(imageView.snp.top)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
    
}
