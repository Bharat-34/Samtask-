//
//  ContentView.swift
//  Samtask
//
//  Created by M1073618 on 05/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var objUserProfileModel = PokemonModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
            
                ForEach(0..<objUserProfileModel.items.count, id: \.self) { item in
                    
                    if item == self.objUserProfileModel.items.count - 1 {
                        listView(mmmm: objUserProfileModel.items[item], isLast: true, listData: self.objUserProfileModel)
                    } else {
                        listView(mmmm: objUserProfileModel.items[item], isLast: false, listData: self.objUserProfileModel)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
