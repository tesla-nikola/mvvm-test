//
//  ArticleViewModelTests.swift
//  mvvm-testTests
//
//  Created by Soham Ray on 15/06/20.
//  Copyright © 2020 jet2travels. All rights reserved.
//

import XCTest
@testable import mvvm_test

class ArticleViewModelTests: XCTestCase {
    
    func test_ViewModeliSNotNil() {
        let viewModel = ArticlesViewModel(client: ArtliclesListClient())
        XCTAssertNotNil(viewModel)
    }
    
    func test_ViewmodelCurrentPageIsInitializedToZero() {
        let viewModel = ArticlesViewModel(client: ArtliclesListClient())
        XCTAssertTrue(viewModel.currentPage == 1)
    }
    
    func test_ViewmodelBlogListIsInitialisedToEmpty() {
        let viewModel = ArticlesViewModel(client: ArtliclesListClient())
        XCTAssertTrue(viewModel.blogsList.isEmpty)
    }
    
    func test_ViewmodelApiClientIsNotNil() {
        let viewModel = ArticlesViewModel(client: ArtliclesListClient())
        XCTAssertNotNil(viewModel.apiClient)
    }
}
