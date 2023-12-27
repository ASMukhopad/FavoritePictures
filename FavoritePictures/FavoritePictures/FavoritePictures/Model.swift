//
//  Model.swift
//  FavoritePictures
//
//  Created by Alexander on 23.12.2023.
//

import Foundation
import RealmSwift

//struct Model: Decodable {
//    let fileSizeBytes: Int?
//    let url: String?
//}
//
//class Model: NSObject {
//    
//    static var sharedInstance = Model()
//    var likes = [Like]()
//    typealias completionHandler = () -> Void
//    let realm = try! Realm()
//    
//    func addTask(like: Like, comletion: completionHandler) {
//        self.realm.beginWrite()
//        self.realm.add(like)
//        try! self.realm.commitWrite()
//        print("Task saved!")
//        comletion()
//    }
//    
//    func loadTasks(comletion: completionHandler) {
//        self.realm.beginWrite()
//        let savedLikes = self.realm.objects(Like.self)
//        self.likes.removeAll()
//        self.likes.append(contentsOf: savedLikes)
//        try! self.realm.commitWrite()
//        comletion()
//    }
//}
