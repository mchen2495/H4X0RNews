//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Michael Chen on 12/29/20.
//

import Foundation

/*ObservableObject mean this class can "boardcast" its property to let other classes know about it
  by "publishing" it
 */
class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            
                            DispatchQueue.main.async {
                                //update for "posts" need to happen on main thread since others classes/structs are listening to it
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
