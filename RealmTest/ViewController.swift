//
//  ViewController.swift
//  RealmTest
//
//  Created by Rivile on 1/26/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .background).async {
            Api.instance.getData(urlString: "http://tcdashapi.rivile.local/Gifts/List", id: 1, keyId: "CompanyId") { (gifts: [GiftModel]?, error) in
                if let error = error{
                    print(error)
                }else {
                    guard let gifts = gifts else {return}
                    let realm = try! Realm()
                    for cat in gifts {
                        try! realm.write {
                            realm.create(GiftModel.self, value: cat, update: .modified)
                        }
                    }
                }
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            Api.instance.getData(urlString: "http://tcdashapi.rivile.local/Gifts/Get", id: 12, keyId: "Id") { (mainGift: GiftsDetailsModel?, error) in
                if let error = error{
                    print(error)
                }else {
                    guard let mainGift = mainGift else {return}
                    let realm = try! Realm()
                    for gallery in mainGift.gallary{
                        try! realm.write {
                            //realm.create(Gallary.self, value: gallery, update: .all)
                            realm.add(gallery, update: .all)
                        }
                    }
                    for specific in mainGift.giftSpecification{
                        try! realm.write {
                            realm.create(GiftSpecification.self, value: specific, update: .all)
                        }
                    }
                }
            }
        }
         print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
       
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let model = realm.objects(GiftModel.self)
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let realm = try! Realm()
        let model = realm.objects(GiftModel.self)
        realm.refresh()
        cell.textLabel?.text = model[indexPath.row].des
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let realm = try! Realm()
        let model = realm.objects(GiftModel.self)
        print(model[indexPath.row])
        try! realm.write {
            realm.delete(model[indexPath.row])
        }
        
        
        tableView.reloadData()
    }
}
