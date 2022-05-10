//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/10.
//

import SwiftUI

struct ThemePicker: View {
    //부모 뷰에서 받아올 거임
    @Binding var selection : Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
