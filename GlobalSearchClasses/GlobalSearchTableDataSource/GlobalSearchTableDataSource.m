//
//  GlobalSearchTableDataSource.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "GlobalSearchTableDataSource.h"
#import "HomeSearchTableViewCell.h"
#import "Utility.h"

static NSString *homeSearchTableCellIdentifier = @"HomeSearchTableViewCell";

@interface GlobalSearchTableDataSource (){
    
}
@property(nonatomic,strong) NSMutableArray *dataSource;
@property(nonatomic,strong) UITableView *tblView;

@end

@implementation GlobalSearchTableDataSource

-(instancetype)init{
    self = [super init];
   
    if (self) {
        [self loadDataSource];
    }
    
    return self;
}

-(NSMutableArray *)dataSource{
  
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(NSMutableArray *)dataList{
    
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}


-(void)updateData:(NSArray *)inData{
 
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray: inData];
    [self updateDisplayView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeSearchTableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier: homeSearchTableCellIdentifier];
   
    [aCell updateUIContentWithData: self.dataSource[indexPath.row]];
    
    return aCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

#pragma mark-
#pragma mark- Global Search Delegate

-(void)configureTableView:(UITableView *)inTableView{
    
    [inTableView registerNib:[UINib nibWithNibName:homeSearchTableCellIdentifier bundle: nil] forCellReuseIdentifier: homeSearchTableCellIdentifier];
    self.tblView = inTableView;
    [self updateDisplayView];
}

-(void)searchForText:(NSString*)inSearchText{
   
    NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"title CONTAINS[C] %@",inSearchText];
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"address CONTAINS[C] %@",inSearchText];
    NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"tag CONTAINS[C] %@",inSearchText];
    NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"phone CONTAINS[C] %@",inSearchText];

    NSArray *orPredicates = [NSArray arrayWithObjects: predicate1,predicate2, predicate3,predicate4,nil];
   
    NSCompoundPredicate *aPredicate = [NSCompoundPredicate orPredicateWithSubpredicates: orPredicates];
    NSArray *aFilteredObjects = [self.dataList filteredArrayUsingPredicate: aPredicate];
    [self updateData: aFilteredObjects];
}

-(void)updateDisplayView{
    
    [self.tblView reloadData];
}

-(void)cancelSearch{

    [self updateData: self.dataList];
}

-(void)loadDataSource{
   
    //**it will run only one time.
    
    NSArray *aDataLiast = [Utility getDataFromPlist:@"ItemList"];
    if (aDataLiast.count > 0) {
        [self.dataList addObjectsFromArray: aDataLiast];
    }
//    [self updateData: self.dataList];
}

-(id)getDataObjectAtIndex:(NSIndexPath *)inIndexPath{
    
    return self.dataSource[inIndexPath.row];
}

-(NSArray*)getDataList{
    return  self.dataSource;
}



@end
