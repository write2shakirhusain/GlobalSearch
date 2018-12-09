//
//  UISearchBar+SearchBar_Color.m
//  GlobalSearch
//
//  Created by Shakir Husain on 09/12/18.
//  Copyright © 2018 Shakir Husain. All rights reserved.
//

#import "UISearchBar+Color.h"

@implementation UISearchBar (SearchBar_Color)

-(void)setTextColor:(UIColor*)inColor{
    
    for (UIView *subView in self.subviews)
    {
        for (UIView *secondLevelSubview in subView.subviews) {
            if ([secondLevelSubview isKindOfClass:[UITextField class]])
            {
                UITextField *searchBarTextField = (UITextField *)secondLevelSubview;
                //set font color here
                searchBarTextField.textColor = inColor;
                break;
            }
        }
    }

}

@end
