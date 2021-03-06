//
//  FeedViewController.swift
//  Instar
//
//  Created by π π on 2022/06/21.
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
        imagePickerController.allowsEditing = true  // μ΄λ―Έμ§λ₯Ό μμ νκ±°λ μλ₯΄κ±°λ ν μ μλμ½λ
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
    // UIImagePickerControllerDelegateλ₯Ό μ¬μ©νλ €λ©΄ UINavigationControllerDelegate μ΄ λ¬΄μ‘°κ±΄ μ¬μ©λμ΄μΌνλ€
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // μ΄λ―Έμ§λ₯Ό μ νν λ€μμ μμλλ λ©μλ
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
