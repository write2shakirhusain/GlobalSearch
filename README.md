# Global Search
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.

This is very  useful when we wanna create global search functionality in our iOS app
The integration is very simple in Four steps :

Step 1 :

Drag and drop GlobalSearchClasses folder into your Project and then import GlobalSearchHeaders 

#import "GlobalSearchHeaders.h"


Step 2 :
// create and setup Global Search view controller

   globalSearchViewCon = [[GlobalSearchViewController alloc] initWithNibName:@"GlobalSearchViewController" bundle: nil];
    globalSearchViewCon.searchViewDelegate = self;
    [globalSearchViewCon setupSearchViewController: self];

Step 3 :

//  Show on any click event
        
[globalSearchViewCon showSearchView];


Step 4 :

//  This step is optional

// Implement global search view delegate if required.

-(void)didShowSearchView:(GlobalSearchViewController *)innSearch{

}

-(void)didHideSearchView:(GlobalSearchViewController *)innSearch{

}

-(void)didSelectSearchData:(GlobalSearchViewController *)inSearch andSearchData:(id)inData{
   
}



 
