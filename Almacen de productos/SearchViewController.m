//
//  SearchViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/8/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SearchViewController.h"
#import "ItemListViewController.h"

@interface SearchViewController ()
@property (nonatomic,strong)NSMutableArray* history;
@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.history=[[NSMutableArray alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.tableViewHistory.delegate = self;
    //self.tableViewHistory.dataSource = self;
    self.searchBar.delegate=self;
    [self setTitle:@"Busca tu producto"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.history.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
#pragma mark searchbarç
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(self.searchBar.text);
    ItemListViewController * controller=[[ItemListViewController alloc]initWithInput:self.searchBar.text];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
