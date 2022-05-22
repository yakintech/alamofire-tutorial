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
        VStack{
            
            ForEach(categories, id:\.self){item in
                Text(item.name)
            }
            
        }.onAppear(){
            
            let request = AF.request("https://northwind.vercel.app/api/categories");
            
            request.responseDecodable(of: [Category].self){ response in
                categories = response.value ?? []
            }
            
        }
    }
}

struct CategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListScreen()
    }
}
