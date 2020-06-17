//
//  ArticleModelTestCase.swift
//  mvvm-testTests
//
//  Created by Soham Ray on 17/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import XCTest
@testable import mvvm_test

class ArticleModelTestCase: XCTestCase {

    func test_ArticleModelSuccess() {
        
        let data = """
        [{"id":"11","createdAt":"2020-04-17T00:47:15.927Z","content":"The IB bus is down, transmit the primary port so we can transmit the THX system!","comments":95891,"likes":55910,"media":[{"id":"11","blogId":"11","createdAt":"2020-04-16T21:39:27.104Z","image":"https://s3.amazonaws.com/uifaces/faces/twitter/okcoker/128.jpg","title":"sensor","url":"https://ara.name"}],"user":[{"id":"11","blogId":"11","createdAt":"2020-04-17T02:48:32.967Z","name":"Kelly","avatar":"https://s3.amazonaws.com/uifaces/faces/twitter/kaysix_dizzy/128.jpg","lastname":"Schaden","city":"Port Tyresefurt","designation":"Lead Tactics Assistant","about":"If we calculate the bus, we can get to the RAM transmitter through the 1080p TCP capacitor!"}]}]
        """.data(using: .utf8)
        
        let articleDecode = try? JSONDecoder().decode(Blogs.self, from: data!)
        XCTAssertTrue(articleDecode!.count > 0)
    }
}
