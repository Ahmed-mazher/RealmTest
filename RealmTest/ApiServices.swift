//
//  OfferApi.swift
//  TalabatyDashboard
//
//  Created by Ahmed_mazher on 8/5/19.
//  Copyright © 2019 Ahmed_mazher. All rights reserved.
//

import UIKit


class Api {
    static let instance = Api()
    
    
    
    // function without genirics
    
    /*  func getOfferOperation(url: URL, companyId: Int, key: String, completion:@escaping ([OfferModel]?, Error?)-> Void){
     var request = URLRequest(url: url)
     request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
     request.httpMethod = "POST"
     
     let param =
     [key: companyId,"token":"S5lS?@9QnsO7T]s"] as [String : Any]
     
     request.httpBody = param.percentEscaped().data(using: .utf8)
     let task = URLSession.shared.dataTask(with: request) { data, response, error in
     guard let data = data,
     let response = response as? HTTPURLResponse,error == nil else {
     // check for fundamental networking error
     return
     }
     // MARK:- HANDLE RESPONSE
     do {
     let offers = try JSONDecoder().decode([OfferModel].self, from: data)
     completion(offers, nil)
     } catch {
     print(error)
     completion(nil, error)
     }
     guard (200 ... 299) ~= response.statusCode else {
     // check for http errors
     print("statusCode should be 2xx, but is \(response.statusCode)")
     return
     }
     
     }
     task.resume()
     }*/
    func isUniqueName(urlString: String, id: Int, keyId: String, name: String, keyName: String, completion:@escaping (Int?, Error?)-> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let param =
            [keyId: id, keyName: name, "token": "S5lS?@9QnsO7T]s"] as [String : Any]
        
        request.httpBody = param.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,error == nil else {
                    // check for fundamental networking error
                    return
            }
            // MARK:- HANDLE RESPONSE
            
            let offers = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Int
            completion(offers, nil)
            
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
    func getData<T: Codable>(urlString: String, id: Int, keyId: String, completion:@escaping (T?, Error?)-> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let param =
            [keyId: id,"token":"S5lS?@9QnsO7T]s"] as [String : Any]
        
        request.httpBody = param.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,error == nil else {
                    // check for fundamental networking error
                    return
            }
            // MARK:- HANDLE RESPONSE
            do {
                let offers = try JSONDecoder().decode(T.self, from: data)
                completion(offers, nil)
            } catch {
                print(error)
                completion(nil, error)
            }
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
    func postModelData<T: Codable>(urlString: String, list: T, key: String, completion:@escaping (String?, Error?)-> Void){
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let model = list
        let jsonEncoder = JSONEncoder()
        let json : String
        do{
            let jsonData = try! jsonEncoder.encode(model)
            print(jsonData)
            json = String(data: jsonData, encoding: String.Encoding.utf8)!
            print(json)
            
        }
        
        let param =
            [key: json,"token":"S5lS?@9QnsO7T]s"] as [String : Any]
        
        
        request.httpBody = param.percentEscaped().data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,error == nil else {
                    // check for fundamental networking error
                    return
            }
            
            // MARK:- HANDLE RESPONSE
            let offers = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! String
            completion(offers, nil)
            
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                return
            }
            
        }
        task.resume()
    }
    
}




// MARK: - these Extensions FOR send post with multiparameters

extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}
extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

