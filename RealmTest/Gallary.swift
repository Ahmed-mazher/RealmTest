/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import UIKit
import RealmSwift

class Gallary : Object, Codable {
	let id = RealmOptional<Int>()
	let flag = RealmOptional<Int>()
	@objc dynamic var path : String? = nil
	let productId = RealmOptional<Int>()
	let offerId = RealmOptional<Int>()
	let giftId = RealmOptional<Int>()

    override static func primaryKey() -> String? {
        return "id"
    }
    
	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case flag = "Flag"
		case path = "Path"
		case productId = "ProductId"
		case offerId = "OfferId"
		case giftId = "GiftId"
	}
    convenience init(id: Int?, flag: Int?, path: String?, productId: Int?, offerId: Int?, giftId: Int?) {
        self.init()
        self.id.value = id
        self.flag.value = flag
        self.path = path
        self.productId.value = productId
        self.offerId.value = offerId
        self.giftId.value = giftId
    }
    
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        id.value = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        flag.value = try values.decodeIfPresent(Int.self, forKey: .flag) ?? 0
		path = try values.decodeIfPresent(String.self, forKey: .path)
        productId.value = try values.decodeIfPresent(Int.self, forKey: .productId) ?? 0
        offerId.value = try values.decodeIfPresent(Int.self, forKey: .offerId) ?? 0
        giftId.value = try values.decodeIfPresent(Int.self, forKey: .giftId) ?? 0
	}

}
