//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Park Kangwook on 2022/05/09.
//

import SwiftUI

//우리가 custom한 레이블을 계속 가져다 쓰기 위한 틀을 만드는 작업이다!
//일일히 View에다가 custom한 코드를 치면 비효율적이기 때문!
struct TrailingIconLabelStyle: LabelStyle {
    
    //이거는 Body(configuration: ) function이다.
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
            //image와 label text를 지칭하는 파라미터들!
        }
    }
}

//여기 코드 ㅅㅂ 뭔소리임
//이 extension은 TrailingIconLabelStyle을 상속받는 LabelStyle에서만 적용된다는 의미
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
