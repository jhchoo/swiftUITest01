//
//   MyText.swift
//  swiftUITest
//
//  Created by jae hwan choo on 2020/10/16.
//

import SwiftUI

struct MyTextView: View {
    
    @State var text = ""
    @State var index: Int = 0
    let colorArray = [UIColor.deepRed, UIColor.white, UIColor.yellow, UIColor.green]
        
    // @Binding
    var isActive: Bool
    
    // 생성자.
    // init(isActive: Binding<Bool> = .constant(false)) {
    init(isActive: Bool = false) {
        self.isActive = isActive
    }
    
    var body: some View {
        Color(self.colorArray[self.index]).overlay(
            VStack {
                Text("배경 아이템 인덱스 \(index)").fontWeight(.bold).font(.system(size: 30))
                Text("활성화 상태 \(String(isActive))").fontWeight(.bold).font(.system(size: 30))
            }
            
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            print("ContentView appeared!")
        }
        .onDisappear {
            print("ContentView disappeared!")
        }
        .onTapGesture {
            print("ContentView onTapGesture!")
            if self.index == colorArray.count - 1 {
                self.index = 0
            } else {
                self.index += 1
            }
            
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
