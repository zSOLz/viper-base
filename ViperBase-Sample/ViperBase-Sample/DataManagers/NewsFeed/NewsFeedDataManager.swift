//
//  NewsFeedDataManager.swift
//  ViperBase-Sample
//
//  Created by SOL on 03.05.17.
//  Copyright © 2017 SOL. All rights reserved.
//

import Foundation

final class NewsFeedDataManager: NSObject, NewsFeedDataManagerInterface {
    
    // MARK: - NewsFeedDataManagerInterface
    
    func loadNews(success: (([NewsFeedArticle])->Void)?, failure: ((Error)->Void)?) {
        // Simulate internet delay
        // httpDataSource.get(endpoint: "newsFeed", success: ... , failure: ... )
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            var articles = [NewsFeedArticle]()
            
            articles.append(NewsFeedArticle(articleId: "1",
                                            title: "Preview for May FOMC",
                                            authorName: "Christopher Vecchio",
                                            image: nil,
                                            text: "Without new economic projections today or a press conferece, there's no shot the Fed raises rates. Instead, look to the policy statement to be the catalyst for price action."))
            
            articles.append(NewsFeedArticle(articleId: "2",
                                            title: "Charts Ahead of FOMC",
                                            authorName: "Ilya Spivak",
                                            image: nil,
                                            text: "Today, we started off by looking at the US Dollar Index (DXY) ahead of the FOMC rate decision and policy statement later today. No expectation of a move out of the Fed, so traders will focus on the language in the statement for clues as to future moves."))
            
            articles.append(NewsFeedArticle(articleId: "3",
                                            title: "Euro to Look Past GDP Data",
                                            authorName: "Christopher Vecchio",
                                            image: nil,
                                            text: "Eurozone GDP figures headline the economic calendar in European trading hours. The on-year growth rate is expected to register at 1.7 percent in the first quarter, unchanged from the three months through December 2016. The quarterly gain is projected at 0.5 percent, also a repeat of the prior period."))
            
            // Call success copmlete data loading
            success?(articles)
        }
    }
}
