//
//  LoadingView.swift
//  BookListDemo
//
//  Created by David Rynn on 6/14/19.
//  Copyright © 2019 David Rynn. All rights reserved.
//

import SwiftUI

struct LoadingView<T> : View where T: View {
    
    @Binding var isShowing: Bool
    var content: () -> T
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if (!self.isShowing) {
                    self.content()
                }
                if (self.isShowing) {
                    self.content()
                        .disabled(true)
                        .blur(radius: 3)
                    
                    VStack {
                        Text("Loading...")
                        ActivityIndicator(style: .large)
                        }
                        .frame(width: geometry.size.width / 2,
                               height: geometry.size.height / 5)
                        .background(Color.secondary.colorInvert())
                        .foregroundColor(Color.primary)
                        .cornerRadius(20)
                    
                }
            }
        }
    }
}

#if DEBUG
struct LoadingView_Previews : PreviewProvider {
    static var previews: some View {
        LoadingView(isShowing: .constant(false)) {
            NavigationView {
                List(["1", "2", "3", "4", "5"].identified(by: \.self)) { row in
                    Text(row)
                    }.navigationBarTitle(Text("A List"), displayMode: .large)
            }
        }
    }
}
#endif
