//
//  ContentView.swift
//  MacApp
//
//  Created by admin on 06/04/22.
//

import SwiftUI

struct Option:Hashable{
    let title:String
    let imageName:String
    let position:Int
}
struct ContentView: View {
    
    @State var currentOption=0
    let options:[Option]=[
        .init(title: "Home", imageName: "house",position:1 ),
        .init(title: "About", imageName: "info.circle",position:2 ),
        .init(title: "Settings", imageName: "gear",position:3 ),
        .init(title: "Social", imageName: "message" ,position:4)
    ]
    var body: some View {
        NavigationView{
            ListView(options:options,
            currentSelection: $currentOption)
            switch currentOption{
            case 1:
                Text("About the Mac Os App")
            default:
                MainView()
            }
            
        }
        .frame(minWidth:600,minHeight: 400)
    }
}

struct ListView:View{
    let options:[Option]
    @Binding var currentSelection:Int;
    var body:some View{
        VStack{
            let current=options[currentSelection]
            ForEach(options,id: \.self){option in
                HStack{
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20)
                    
                    Text(option.title)
                        .foregroundColor(current == option ? Color.blue : Color.black)
                    
                    Spacer()
                }
                .padding(8)
                .onTapGesture {
                    if( self.currentSelection==1){
                        self.currentSelection=0
                    }else if (self.currentSelection==2){
                        self.currentSelection=3
                    }
                    else{
                        self.currentSelection=1
                    }
                    
                }
            }
            Spacer()
        }
    }
}
struct MainView:View{
    
    let cols:[GridItem]=[
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
       
              ]
    let videoImages=Array(1...6).map{"video\($0)"}
    var body:some View{
        VStack{
            Image("header")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            LazyVGrid(columns:cols){
                ForEach(videoImages,id: \.self){imageName in
                    
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                       
                        
                        }
                    
                   
            }
            
           // Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
