//
//  NetworkHelper.swift
//  Samtask
//
//   Created by M1073618 on 05/10/21.
//

import UIKit

class NetworkHelper: NSObject {
    
    func get(withurl urlobj:String, withparameters parameters:String, completionhandler completionblock:@escaping(_ response:AnyObject,_ error:String) -> Void){
        
        let url = URL(string: urlobj)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.httpBody = parameters.data(using: .utf8)
        
        let download = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if data != nil
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as AnyObject
                    let error = ""
                    completionblock(json,error)
                }
                catch {
                    
                }
            }
        }
        download.resume()
        
    }
    
    
}

