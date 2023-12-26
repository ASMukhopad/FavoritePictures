//
//  FavoriteImagesViewController.swift
//  FavoritePictures
//
//  Created by Alexander on 23.12.2023.
//

import UIKit

class FavoriteImagesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "PictureFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureFeedTableViewCell")
    }
}

extension FavoriteImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PictureFeedTableViewCell", for: indexPath) as? PictureFeedTableViewCell else { return UITableViewCell() }
        return cell
    }
}

extension FavoriteImagesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
