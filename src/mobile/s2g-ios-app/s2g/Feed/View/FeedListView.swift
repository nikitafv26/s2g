//
//  FeedListView.swift
//  s2g
//
//  Created by Nikita Fedorenko on 05.06.2021.
//

import SwiftUI

struct Feed: Identifiable {
    var id = UUID()
    var name: String
    var date: String
    var imageName: String
}

let feeds: [Feed] = [
    Feed(name: "Basketball", date: "20 march", imageName: "basketball"),
    Feed(name: "Football", date: "30 march", imageName: "football"),
    Feed(name: "Run", date: "1 april", imageName: "run"),
    Feed(name: "Swimming", date: "2 april", imageName: "swimming"),
    Feed(name: "Bicycle", date: "2 april", imageName: "bicycle")
]

struct FeedListView: View {
    
    var testData: [Feed] = []
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    FeedCell(geometry: geometry)
                }
                .navigationBarTitle(Text("Activities"))
            }
        }
    }
}

struct FeedCell: View {
    let geometry: GeometryProxy
    
    var body: some View {
        NavigationLink (destination: Text("Activity")) {
            HStack (spacing: 0) {
                
                VStack (alignment: .trailing){
                    
                    HStack(alignment: .bottom){
                        Image(systemName: "bicycle")
                            .resizable()
                            .frame(width: 60, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                        Text("18:30")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 10)
                    
                    Text("Bicycle")
                        .font(.title)
                        .bold()
                    
                    Text("20 march")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom){
                        VStack{
                            Image(systemName: "person.2.fill")
                            Text("6")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text("1 km")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack{
                            Image(systemName: "clock")
                            Text("2-4h")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.top, 2)
                }
                .frame(width: geometry.size.width * 0.33)
                
                
                
                VStack(alignment: .trailing){
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("I'm going to ride with my friends, lets go together...")
                    Spacer()
                    Text("Join")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.title3)
                }
                .padding(.trailing, 10)
                .frame(width: geometry.size.width * 0.67)
            }
        }
    }
}


struct FeedListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeedListView(testData: feeds)
                .previewDisplayName("iPhone X")
                .previewDevice("iPhone X")
            
            FeedListView(testData: feeds)
                .previewLayout(.fixed(width: 812, height: 375))
                .previewDisplayName("iPhone X")
                .previewDevice("iPhone X")
        }
        
    }
}
