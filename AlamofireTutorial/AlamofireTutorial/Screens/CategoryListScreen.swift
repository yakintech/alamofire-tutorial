//
//  CategoryListScreen.swift
//  AlamofireTutorial
//
//  Created by Çağatay Yıldız on 22.05.2022.
//

import SwiftUI
import Alamofire

struct CategoryListScreen: View {
    
    @State var categories : [Category] = []
    
    var body: some View {
        NavigationView{
            VStack{
                
                ForEach(categories, id:\.self){item in
                    
                    NavigationLink(destination: CategoryDetailScreen(id: item.id)) {
                        Text(item.name)
                            .padding()
                        
                        Button("Delete"){
                            
                            AF.request("https://northwind.vercel.app/api/categories/\(item.id)", method: .delete)
                                .responseData(){ response in
                                    
                                    let request = AF.request("https://northwind.vercel.app/api/categories");
                                    
                                    request.responseDecodable(of: [Category].self){ response in
                                        categories = response.value ?? []
                                    }
                                }
                            
                            
                            
                        }.padding()
                    }
                    .navigationTitle("Navigation")
                }
                
            }.onAppear(){
                
                let request = AF.request("https://northwind.vercel.app/api/categories");
                
                request.responseDecodable(of: [Category].self){ response in
                    categories = response.value ?? []
                }
                
            }
        }
        
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen()
    }
}
