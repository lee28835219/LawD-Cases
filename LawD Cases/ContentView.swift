//
//  ContentView.swift
//  LawD-Cases
//
//  Created by Masterbuilder on 2023/09/18.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var urlString = "https://law.go.kr/판례/(2021도3451)"
        
    var body: some View {
        NavigationView {
            WebView(urlString: $urlString)
                .navigationBarTitle("판례보기", displayMode: .inline)
        }
        .onAppear() {
//            urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=XML"
//            urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=HTML"
//            urlString = "https://www.law.go.kr/DRF/lawService.do?OC=lee28835219&target=prec&ID=228541&type=HTML&mobileYn=Y"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
