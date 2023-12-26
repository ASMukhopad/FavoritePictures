//
//  ViewController.swift
//  FavoritePictures
//
//  Created by Alexander on 23.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
//    let loadDataFetcher = LoadDataFetcher()
//    var model: Model? = nil
    var image = UIImage()
    var images = [UIImage]()
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setupTableView()
//        urlResult()
        imageLoad()
    }
    
//    func urlResult() {
//        let urlString = "https://random.dog/woof.json"
//        self.loadDataFetcher.fetcherDetails(urlString: urlString) { model in
//            guard let model = model else { return }
//            self.model = model
//            self.numbers.append(model.url ?? "4")
//            self.tableView.reloadData()
//            self.urlResult()
//            print(self.numbers)
//        }
//    }
    
    func imageLoad() {
        let api = "https://picsum.photos/200/300"
        guard let apiUrl = URL(string: api) else {
            fatalError("какая-то ошибка")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: apiUrl) { data, response, error in
            guard let data = data,
                  error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage(named: "4")!
//                self.images.append(self.image)
//                self.imageLoad()
//                print(self.images)
            }
        }
        task.resume()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "PictureFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "PictureFeedTableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PictureFeedTableViewCell", for: indexPath) as? PictureFeedTableViewCell else { return UITableViewCell() }
        cell.photoImageView.image = image
        cell.numberCellLabel.text = "\(indexPath.row) "
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return screenWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}