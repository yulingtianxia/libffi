//
//  ContentView.swift
//  Example
//
//  Created by 杨萧玉 on 2024/9/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("FFI size of endocde \"I\" is \(FFIHelper.ffiSize(forEncode: "I"))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
