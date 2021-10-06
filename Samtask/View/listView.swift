//
//  ContentView.swift
//  Samtask
//
//  Created by M1073618 on 05/10/21.
//

import SwiftUI
import Kingfisher

struct listView: View {
   
    @State var mmmm : ListItem
    var isLast: Bool
    
    @ObservedObject var listData : PokemonModel
    
    var body: some View {
        if isLast {
            HStack{
                HStack(alignment: .center){
                    if isLast {
                        
                        KFImage(URL(string: mmmm.image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("id: \(mmmm.idValue)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            Text("Name: \(mmmm.names)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                        }.padding([.leading])
                        .onAppear {
                            
                            print("load more data")
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                if self.listData.items.count != 1118 {
                                    self.listData.currentOffset += 20

                                    self.listData.NetworkCal()
                                }
                            }
                        }
                        
                    } else {
                        
                        KFImage(URL(string: mmmm.image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("id: \(mmmm.idValue)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            Text("Name: \(mmmm.names)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                        }.padding([.leading])
                        
                    }
                    
                }
                Spacer()
            }.background(Color.init(.cyan))
            .cornerRadius(20)
            .padding([.leading, .trailing])
            
        } else {
            
            HStack{
                HStack(alignment: .center){
                    if isLast {
                        
                        KFImage(URL(string: mmmm.image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("id: \(mmmm.idValue)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            Text("Name: \(mmmm.names)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                        }.padding([.leading])
                        
                    } else {
                        
                        KFImage(URL(string: mmmm.image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 100, alignment: .center)
                        
                        VStack(alignment: .leading){
                            Text("id: \(mmmm.idValue)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            Text("Name: \(mmmm.names)")
                                .fontWeight(.bold)
                                .font(.subheadline)
                        }.padding([.leading])
                        
                    }
                    
                }
                Spacer()
            }.background(Color.init(.cyan))
            .cornerRadius(20)
            .padding([.leading, .trailing])
            
        }
    }
}
