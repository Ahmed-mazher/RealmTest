//
//  GiftsDetailsModel.swift
//  RealmTest
//
//  Created by Rivile on 1/27/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit
import RealmSwift


class GiftsDetailsModel : Object, Codable {
    @objc dynamic var gifts : GiftModel?
    let gallary = List<Gallary>()
    let giftSpecification = List<GiftSpecification>()
    
    
    
    
    enum CodingKeys: String, CodingKey {

        case gifts = "Gifts"
        case gallary = "Gallary"
        case giftSpecification = "GiftSpecification"
    }
    
    
    convenience init(gifts: GiftModel?, gallary: [Gallary], giftSpecification: [GiftSpecification]) {
        self.init()
        self.gifts = gifts
        self.gallary.append(objectsIn: gallary)
        self.giftSpecification.append(objectsIn: giftSpecification)
    }
    

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gifts = try values.decodeIfPresent(GiftModel.self, forKey: .gifts)
        gallary.append(objectsIn: try values.decodeIfPresent([Gallary].self, forKey: .gallary)!)
        giftSpecification.append(objectsIn: try values.decodeIfPresent([GiftSpecification].self, forKey: .giftSpecification)!)
    }

}
