//
//  WebView.swift
//  H4X0R News
//
//  Created by Michael Chen on 12/29/20.
//

import Foundation
import WebKit
import SwiftUI

//UIViewRepresentable allows us to create swiftui view that represent a uikit view
struct WebView: UIViewRepresentable {
    
    let urlString: String?
   
    //this will make a uikit view and turn it into a swiftui view
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }


    //what we want to disply in the view that is return above
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
