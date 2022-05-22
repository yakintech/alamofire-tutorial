//
//  AddCategoryScreen.swift
//  AlamofireTutorial
//
//  Created by Çağatay Yıldız on 22.05.2022.
//

import SwiftUI
import Alamofire

struct AddCategoryScreen: View {
    
    @State var categoryName : String = ""
    @State var description : String = ""
    
    var body: some View {
        VStack{
            TextField("Name: ",
                      text: $categoryName
            )
            
            TextField("Description: ",
                      text: $description
            )
            
            
            Button("Add"){
                
                
                let newCategory : [String : Any] = [
                    "name" : categoryName,
                    "description" : description
                ]
                
                
                AF.request("https://northwind.vercel.app/api/categories", method: .post, parameters: newCategory, encoding: JSONEncoding.default).responseDecodable(of: Category.self){ response in
                    
                    print(response.value!)
            
                }
                
                
               
                
            }
        }
    }
}

struct AddCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryScreen()
    }
}
