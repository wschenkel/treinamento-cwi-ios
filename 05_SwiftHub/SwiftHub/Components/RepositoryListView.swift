//
//  RepositoryListView.swift
//  SwiftHub
//
//  Created by Willian schenkel on 27/10/20.
//
import FetchImage
import SwiftUI

struct RepositoryListView: View {
    
    @ObservedObject var image: FetchImage
    let repository: Repository
    private let minimumScaleFactor: CGFloat = 0.7
    
    init(_ repository: Repository) {
        self.repository = repository
        image = FetchImage(url: URL(string: repository.owner.pictureURL)!)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(repository.name)
                    .bold()
                    .font(.title2)
                    .minimumScaleFactor(0.7)
                
                Text(repository.description ?? "Sem descricao")
                    .font(.subheadline)
                    .foregroundColor(Color("discreteGray"))
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .minimumScaleFactor(minimumScaleFactor)
                
                Spacer()
                
                HStack {
                    Text(repository.starCount.description)
                    Text("⭐")
                        .baselineOffset(2)
                        .minimumScaleFactor(minimumScaleFactor)
                }
            }
            
            Spacer()
            
            VStack(alignment: .center, spacing: 4) {
                image
                    .view?
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text(repository.owner.name)
                    .font(.subheadline)
                    .lineLimit(1)
                    .minimumScaleFactor(minimumScaleFactor)
                    .frame(maxWidth: 70)
            }
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
        .padding(10)
        .onAppear {
            self.image.priority = .normal
            self.image.fetch()
        }
        .onDisappear {
            self.image.priority = .low
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView(.mocked)
            .previewLayout(.fixed(width: 375, height: 100))
    }
}
