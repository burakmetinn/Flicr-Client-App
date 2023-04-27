//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by Burak Metin on 1.03.2023.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo Detail"
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "Description label Description label Description label  Description label  Description label  Description label  Description label "
        
        
        if let iconserver = photo?.iconserver,
           let iconfarm = photo?.iconfarm,
           let nsid = photo?.owner,
           NSString(string: iconserver).intValue > 0 {
            networkManager.fetchImages(with: "http://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg") { data in
                self.ownerImageView.image = UIImage(data: data)
            }
        } else {
            networkManager.fetchImages(with: "https://www.flickr.com/images/buddyicon.gif") { data in
                    self.ownerImageView.image = UIImage(data: data)
                }
        }
        
        networkManager.fetchImages(with: photo?.urlZ) { data in
            self.imageView.image = UIImage(data: data)
        }
        
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = photo?.ownername
            
        title = photo?.title
        
        descriptionLabel.text = photo?.description?.content
    }

}
