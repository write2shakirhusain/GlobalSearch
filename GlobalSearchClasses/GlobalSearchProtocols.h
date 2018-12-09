//
//  GlobalSearchProtocol.h
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GlobalSearchViewController;

NS_ASSUME_NONNULL_BEGIN

@protocol GlobalSearchDelegate <NSObject>

@required

-(void)searchForText:(NSString*)inSearchText;
-(void)cancelSearch;
-(void)configureTableView:(UITableView *)inTableView;
-(void)updateDisplayView;

@optional

-(void)loadDataSource;
-(id)getDataObjectAtIndex:(NSIndexPath *)inIndexPath;
-(NSArray*)getDataList;

@end

@protocol GlobalSearchViewDelegate <NSObject>

@optional
-(void)didShowSearchView:(GlobalSearchViewController *)innSearch;
-(void)didHideSearchView:(GlobalSearchViewController *)innSearch;

-(void)didSelectSearchData:(GlobalSearchViewController *)inSearch andSearchData:(id)inData;

@end

NS_ASSUME_NONNULL_END
