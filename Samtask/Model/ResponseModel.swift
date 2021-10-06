//
//  ResponseModel.swift
//  Samtask
//
//  Created by M1073618 on 05/10/21.
//


import Foundation
import Combine

struct ListItem: Identifiable,Hashable {
    var id = UUID().uuidString
    
    let idValue : Int
    let names : String
    let image : String
}

class PokemonModel: ObservableObject {    
    
    @Published var items = [ListItem]()
    
    @Published var isLoadingPage = false
    
    @Published var currentOffset = 0
    
    init() {
        NetworkCal()
    }

    
    // Main function to fetch the response
    func NetworkCal() {
        
        NetworkHelper().get(withurl: "https://pokeapi.co/api/v2/pokemon/?offset=\(currentOffset)&limit=20", withparameters: "") { (response, error) in
           // print(response)
            
            if let jsonData = response as? [String:Any]{
                
                if let resultsArray = jsonData["results"] as? [[String:Any]]{
                                        
                    for reqUrl in resultsArray {
                        
                        guard let url = reqUrl["url"] as? String else { return }
                        self.method1(url_: url)
                        
                    }
                }
            }
        }
    }
    
    
    // Actual function to  fetch the pokemon data and to show on listview
    func method1(url_: String){
        
        var sortedArray = [ListItem]()
        NetworkHelper().get(withurl: url_, withparameters: "") { (urlResponse, error) in

            DispatchQueue.main.async {
                
                if let dataJson = urlResponse as? [String:Any] {
                    
                    guard  let id = dataJson["id"] as? Int else {
                        return
                    }
                    
                    guard  let name = dataJson["name"] as? String else {
                        return
                    }
                    
                    if let sprites = dataJson["sprites"] as? [String:Any] {
                        
                        if let front_default = sprites["front_default"] as? String {
                            
                            DispatchQueue.main.async {
                                                                
                                let mm = ListItem(idValue: id, names: name, image: front_default)
                                sortedArray.append(mm)
                                
                                let sortArr = sortedArray.sorted(by: { (user1, user2) -> Bool in
                                    return user1.idValue < user2.idValue
                                })
                                self.items.append(contentsOf: sortArr)
                                                                                            
                            }
                        }
                    }
                }
            }
        }
    }
}
