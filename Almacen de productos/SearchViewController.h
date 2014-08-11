//
//  SearchViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/8/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController :UIViewController<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//@property (weak, nonatomic) IBOutlet UITableView *tableViewHistory;

@end
