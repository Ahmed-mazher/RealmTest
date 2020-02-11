//
//  GiftModel.swift
//  RealmTest
//
//  Created by Rivile on 1/26/20.
//  Copyright © 2020 Rivile. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class GiftModel: Object, Codable {
    let id = RealmOptional<Int>()
    @objc dynamic var barcode:String? = nil
    @objc dynamic var name:String? = nil
    let value = RealmOptional<Double>()
    let organizationGiftType = RealmOptional<Int>()
    @objc dynamic var des:String? = nil
    let companyId = RealmOptional<Int>()
    @objc dynamic var dateString:String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
    enum CodingKeys: String, CodingKey {

        case id = "Id"
        case barcode = "Barcode"
        case name = "Name"
        case value = "Value"
        case organizationGiftType = "OrganizationGiftType"
        case des = "Des"
        case companyId = "CompanyId"
        case dateString = "DateString"
    }
    convenience init(id: Int? = nil, barcode: String? = nil, value : Double? = nil, des: String? = nil, dateString: String? = nil, organizationGiftType: Int? = nil, name: String? = nil, companyId: Int? = nil) {
        self.init()
        self.id.value = id
        self.barcode = barcode
        self.value.value = value
        self.organizationGiftType.value = organizationGiftType
        self.dateString = dateString
        self.name = name
        self.des = des
        self.companyId.value = companyId

    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id.value = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        barcode = try container.decode(String.self, forKey: .barcode)
        name = try container.decode(String.self, forKey: .name)
        value.value = try container.decodeIfPresent(Double.self, forKey: .value) ?? 0
        organizationGiftType.value = try container.decodeIfPresent(Int.self, forKey: .organizationGiftType) ?? 0
        des = try container.decode(String.self, forKey: .des)
        companyId.value = try container.decodeIfPresent(Int.self, forKey: .companyId) ?? 0
        dateString = try container.decode(String.self, forKey: .dateString)
    }
    
    
    
}

