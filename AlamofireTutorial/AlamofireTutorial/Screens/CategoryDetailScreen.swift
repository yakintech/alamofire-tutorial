//
//  CategoryDetailScreen.swift
//  AlamofireTutorial
//
//  Created by Çağatay Yıldız on 22.05.2022.
//

import SwiftUI
import Alamofire

struct CategoryDetailScreen: View {
    
    var id : Int
    
   @State var category : Category = Category()
    
    var body: some View {
       
        VStack{
            Text(String(category.id))
                .padding()
            Text(category.name)
                .padding()
            Text(category.description)
                .padding()
            
        }.onAppear(){
            
            let request = AF.request("https://northwind.vercel.app/api/categories/\(id)")
            
            request.responseDecodable(of: Category.self){response in
                
                category = response.value!;
            }
            
        }
    }
}
