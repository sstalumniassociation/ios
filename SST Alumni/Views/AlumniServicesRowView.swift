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
        ConditionalLink(actionURL: actionURL,
                        ctaTitle: ctaTitle) {
            VStack(alignment: .leading, spacing: 0) {
                if let image {
                    GeometryReader { proxy in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: proxy.size.height)
                    }
                    .aspectRatio(2/1, contentMode: .fit)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(description)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        } sheetContent: {
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: .systemGray6))
        }
        .listRowSeparator(.hidden)
    }
}

struct ConditionalLink<Content: View, SheetContent: View>: View {
    
    var actionURL: URL?
    var ctaTitle: String?
    
    @ViewBuilder
    var content: (() -> Content)
    
    @ViewBuilder
    var sheetContent: (() -> SheetContent)
    
    @State private var isContentSheetPresented = false
    
    var body: some View {
        if let actionURL, let ctaTitle {
            Link(destination: actionURL) {
                VStack(spacing: 0) {
                    content()
                    
                    Divider()
                    
                    HStack {
                        Text(ctaTitle)
                        Spacer()
                        Image(systemName: "safari")
                    }
                    .foregroundStyle(.blue)
                    .padding()
                }
            }
            .buttonStyle(.plain)
        } else if let ctaTitle {
            Button {
                isContentSheetPresented.toggle()
            } label: {
                VStack(spacing: 0) {
                    content()
                    
                    Divider()
                    
                    HStack {
                        Text(ctaTitle)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(.blue)
                    .padding()
                }
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isContentSheetPresented) {
                sheetContent()
            }
        }
    }
}
