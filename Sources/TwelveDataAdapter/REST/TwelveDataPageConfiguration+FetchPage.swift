//
//  Created by Kurlovich Vitali on 10/17/26.
//

import DataLayer
import TwelveDataREST

extension TwelveDataPageConfiguration {
    init(_ page: FetchPage) {
        self.init(page: page.page, size: page.size)
    }
}
