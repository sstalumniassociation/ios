//
//  AlumniServicesRowView.swift
//  SST Alumni
//
//  Created by Jia Chen Yee on 16/9/23.
//

import SwiftUI

struct AlumniServicesRowView<Content: View>: View {
    
    @State private var isContentSheetPresented = false
    
    var image: Image?
    
    var title: String
    var description: String
    
    var ctaTitle: String?
    
    var actionURL: URL?
    var content: Content
    
    init(image: Image? = nil, title: String, description: String,
         ctaTitle: String? = nil,
         @ViewBuilder content: () -> Content) {
        self.image = image
        self.title = title
        self.ctaTitle = ctaTitle
        self.description = description
        self.content = content()
    }
    
    init(image: Image? = nil,
         title: String, 
         description: String,
         ctaTitle: String? = nil,
         actionURL: URL? = nil) where Content == EmptyView {
        self.image = image
        self.title = title
        self.description = description
        self.actionURL = actionURL
        self.ctaTitle = ctaTitle
        self.content = EmptyView()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let image {
                Rectangle()
                    .fill(.clear)
                    .aspectRatio(2/1, contentMode: .fit)
                    .background {
                        image
                            .resizable()
                            .scaledToFill()
                    }
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                
                if let actionURL, let ctaTitle {
                    Link(ctaTitle, destination: actionURL)
                        .buttonStyle(.borderedProminent)
                        .padding(.top)
                }
                
                if let ctaTitle, !(content is EmptyView) {
                    Button(ctaTitle) {
                        isContentSheetPresented.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top)
                    .sheet(isPresented: $isContentSheetPresented) {
                        content
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .systemGray6))
        }
        .listRowSeparator(.hidden)
    }
}
