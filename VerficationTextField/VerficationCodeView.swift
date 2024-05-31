//
//  FishCheckCode.swift
//  IM
//
//  Created by xiaoxiang's m1 mbp on 2024/5/30.
//

import SwiftUI

struct VerficationCodeView: View {
    @State private var codes: [String] = Array(repeating: "", count: 6)
    @State private var isFirstResponders: [Bool] = [true, false, false, false, false, false]

    func changeFirstResponder(_ idx: Int) {
        for i in 0..<isFirstResponders.count {
            if i != idx {
                isFirstResponders[i] = false
            } else {
                isFirstResponders[i] = true
            }
        }
    }
    var body: some View {
        VStack {

            Button("Set Codes") {
                self.codes = ["1", "2", "3", "4", "5", "6"]
            }

            HStack(spacing: 10) {
                ForEach(0..<6, id: \.self) { index in

                    VerficationTextField(
                        text: $codes[index],
                        isFirstResponder: isFirstResponders[index],
                        onChanged: { value in
                            self.changeFirstResponder(index + 1)
                        },
                        onDelete: {
                            self.changeFirstResponder(index - 1)
                        }
                    )
                    .frame(width: 40, height: 40)
                    .multilineTextAlignment(.center)
                    .padding(.top, 0)
                    .overlay(
                        VStack {
                            Spacer()
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.yellow)
                        }
                    )

                }
            }

        }
    }
}

#Preview {
    VerficationCodeView()
}
