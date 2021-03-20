//
//  ContentView.swift
//  H4X0R News
//
//  Created by Michael Chen on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    
    //observing the networkManager for changes
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            //for every single "post" in the posts array do something
            List(networkManager.posts){ post in
                //create a naviation link to detail view for each cell
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear(perform: {
            //fetch the data when the view appears
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




