/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import UIKit
import RealmSwift

class GiftSpecification : Object, Codable {
	let id = RealmOptional<Int>()
	@objc dynamic var name: String? = nil
	@objc dynamic var value: String? = nil
	let giftId = RealmOptional<Int>()

    override static func primaryKey() -> String? {
        return "id"
    }
    
	enum CodingKeys: String, CodingKey {

		case id = "Id"
		case name = "Name"
		case value = "Value"
		case giftId = "GiftId"
	}

    convenience init(id: Int?, name: String?, value: String?, giftID: Int?) {
        self.init()
        self.id.value = id
        self.name = name
        self.value = value
        self.giftId.value = giftID
    }
    
	convenience required init(from decoder: Decoder) throws {
        self.init()
		let values = try decoder.container(keyedBy: CodingKeys.self)
        id.value = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		value = try values.decodeIfPresent(String.self, forKey: .value)
        giftId.value = try values.decodeIfPresent(Int.self, forKey: .giftId) ?? 0
	}

}
