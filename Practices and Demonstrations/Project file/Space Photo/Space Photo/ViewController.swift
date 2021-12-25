//
//  ViewController.swift
//  Space Photo
//
//  Created by Wayne on 2021/12/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        photoImageView.image = UIImage(systemName: "photo.on.rectangle")
        
        // Do any additional setup after loading the view.
        photoInfoController.fetchPhoto { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoInfo):
                    self.updateUI(with: photoInfo)
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
        
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        photoInfoController.fetchImage(from: photoInfo.url) {
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.photoImageView.image = image
                    self.navigationItem.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    self.copyrightLabel.text = photoInfo.copyright
                case .failure(let error):
                    self.updateUI(with: error)
                }
            }
        }
    }
    
    func updateUI(with error: Error) {
        self.navigationItem.title = "Error fetch photo"
        self.descriptionLabel.text = error.localizedDescription
        self.copyrightLabel.text = ""
        self.photoImageView.image = UIImage(systemName: "exclamationmark.octagon")
    }


}

