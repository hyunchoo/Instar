//
//  FeedViewController.swift
//  Instar
//
//  Created by 🙈 🙊 on 2022/06/21.
//

import UIKit
import SnapKit


final class FeedViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(FeedTabelViewCell.self, forCellReuseIdentifier: "FeedTabelViewCell")
        
        
        return tableView
    }()
    
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true  // 이미지를 수정하거나 자르거나 할수 있는코드
        imagePickerController.delegate = self
        
        
        return imagePickerController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupTableView()
        
    }


}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "instar"
        
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: #selector(didTapUploadButton))
        navigationItem.rightBarButtonItem = uploadButton
    }
    
    @objc func didTapUploadButton() {
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTabelViewCell", for: indexPath) as? FeedTabelViewCell
        cell?.selectionStyle = .none
        
        cell?.setup()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // UIImagePickerControllerDelegate를 사용하려면 UINavigationControllerDelegate 이 무조건 사용되어야한다
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지를 선택후 다음에 시작되는 메소드
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
            
        } else if let originImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originImage
        }
        print(selectImage)
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController(uploadImage: selectImage ?? UIImage()) 
           let navigationController = UINavigationController(rootViewController: uploadViewController)
            navigationController.modalPresentationStyle = .fullScreen
            self?.present(navigationController, animated: true )
        }
     }
}
