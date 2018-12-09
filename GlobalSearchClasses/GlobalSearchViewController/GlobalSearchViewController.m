//
//  GlobalSearchViewController.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "GlobalSearchViewController.h"
#import "GlobalSearchTableDataSource.h"
#import "GlobalSearchTableViewDelegate.h"
#import "GlobalSearchProtocols.h"
#import "UISearchBar+Color.h"

@interface GlobalSearchViewController ()<UISearchBarDelegate>{
    __weak IBOutlet UITableView *tblView;
    __weak IBOutlet UISearchBar *globalSearchView;

    UIViewController* parentViewCon;
}
@property(nonatomic,strong) GlobalSearchTableDataSource* globalSearchDataSource;
@property(nonatomic,strong) GlobalSearchTableViewDelegate* globalSearchTableViewDelegate;

@end

@implementation GlobalSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
    [self setAllDelegate];
    self.title = @"Global Search";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [globalSearchView setTextColor: [UIColor whiteColor]];
    globalSearchView.placeholder = @"Search for #Jacket, #Gold etc. ";
}

-(id<GlobalSearchDelegate>)globalSearchDelegate{
   
    id<GlobalSearchDelegate> delegate = self.globalSearchDataSource;
    return delegate;
}

-(GlobalSearchTableDataSource*)globalSearchDataSource{
    
    if (_globalSearchDataSource == nil) {
        _globalSearchDataSource = [[GlobalSearchTableDataSource alloc] init];
    }
    return _globalSearchDataSource;
}

-(GlobalSearchTableViewDelegate*)globalSearchTableViewDelegate{
   
    if (_globalSearchTableViewDelegate == nil) {
        _globalSearchTableViewDelegate = [[GlobalSearchTableViewDelegate alloc] init];
    }
    return  _globalSearchTableViewDelegate;
}

-(void)setAllDelegate{
    
    tblView.delegate = self.globalSearchTableViewDelegate;
    tblView.dataSource = self.globalSearchDataSource;
    [[self globalSearchDelegate] configureTableView: tblView];
    
    self.globalSearchTableViewDelegate.globalDelegate = [self globalSearchDelegate];
    __weak GlobalSearchViewController *safeSelf = self;
    self.globalSearchTableViewDelegate.blockSelectIndex = ^(NSIndexPath * _Nonnull inIndexPath) {
        NSDictionary *aDataDict = [[safeSelf globalSearchDelegate] getDataObjectAtIndex: inIndexPath];
        [safeSelf gotoViewController: aDataDict];
    };

}

-(void)setupSearchViewController:(UIViewController *)inParentVieCon{
    
    parentViewCon = inParentVieCon;
    [parentViewCon addChildViewController: self];
    [self willMoveToParentViewController: parentViewCon];
    [self didMoveToParentViewController: parentViewCon];
    self.view.alpha = 0;
}

-(void)showSearchView{
   
    CGRect rect = parentViewCon.view.frame;
    rect.origin.x = rect.origin.y = 0;
    self.view.frame = rect;
    [parentViewCon.view addSubview: self.view];

    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self->globalSearchView becomeFirstResponder];
        }
    }];
    [[self globalSearchDelegate] updateDisplayView];
    if (self.searchViewDelegate && [self.searchViewDelegate conformsToProtocol:@protocol(GlobalSearchViewDelegate)] && [self.searchViewDelegate respondsToSelector:@selector(didShowSearchView:)]) {
        [self.searchViewDelegate didShowSearchView: self];
    }

}

-(void)hideSearchView{
    
    [UIView animateWithDuration:0.6 animations:^{
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
        }
    }];
   
    globalSearchView.text = @"";
    [[self globalSearchDelegate] searchForText: globalSearchView.text];
    [globalSearchView resignFirstResponder];

    if (self.searchViewDelegate && [self.searchViewDelegate conformsToProtocol:@protocol(GlobalSearchViewDelegate)] && [self.searchViewDelegate respondsToSelector:@selector(didHideSearchView:)]) {
        [self.searchViewDelegate didHideSearchView: self];
    }
}

#pragma mark-
#pragma mark- Detail view
- (void)gotoViewController:(NSDictionary *)inData {
    
    if (self.searchViewDelegate && [self.searchViewDelegate conformsToProtocol:@protocol(GlobalSearchViewDelegate)] && [self.searchViewDelegate respondsToSelector:@selector(didSelectSearchData:andSearchData:)]) {
        [self.searchViewDelegate didSelectSearchData: self andSearchData: inData];
    }
}

#pragma mark-
#pragma mark- SearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton: YES animated: YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    [[self globalSearchDelegate] searchForText: searchText];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
    [searchBar setShowsCancelButton: NO animated: YES];

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self hideSearchView];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

@end
