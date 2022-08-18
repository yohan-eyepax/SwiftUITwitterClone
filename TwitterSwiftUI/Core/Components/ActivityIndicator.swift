//
//  ActivityIndicator.swift
//  TwitterSwiftUI
//
//  Created by Yohan Alahakoon on 2022-08-18.
//

import SwiftUI

struct ActivityIndicator: View {
    var body: some View {
        VStack{
            
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(.black)
        .opacity(0.25)
        .overlay {
            VStack{
                ProgressView()
                Text("Loading")
                    .font(.caption)
                    .padding(.vertical, 8)
            }
            .frame(width: 120, height: 120)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onTapGesture {
            print("DEBUG: No access for touching elements")
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
