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
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "FavoriteImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteImagesTableViewCell")
    }
}

extension FavoriteImagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteImagesTableViewCell", for: indexPath) as? FavoriteImagesTableViewCell else { return UITableViewCell() }
        if let image = getSavedImage(named: "fileName") {
            cell.likeImage.image = image
        }
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
