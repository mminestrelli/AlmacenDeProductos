//
//  SearchViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/8/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SearchViewController.h"
#import "ItemListViewController.h"
#import "HistoryTableViewCell.h"

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
    self.tableViewHistory.delegate = self;
    self.tableViewHistory.dataSource = self;
    self.searchBar.delegate=self;
    //Mock add
    [self.history addObject:@"ipod"];
    [self.history addObject:@"ipad"];
    
    [self setTitle:@"Buscar"];
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
    static NSString * tableIdentifier = @"HistoryTableViewCell";
    HistoryTableViewCell * historyCell = (HistoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (historyCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HistoryTableViewCell" owner:self options:nil];
        historyCell = [nib objectAtIndex:0];
    }
    
    NSString* input=[self.history objectAtIndex:indexPath.row];
    historyCell.labelHistoryItem.text=input;
    historyCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return historyCell;
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* input=[self.history objectAtIndex:indexPath.row];
    [self searchFromHistoryWithInput:input];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 36;
}
#pragma mark keyboard
-(void)dismissKeyboard{
    [self.searchBar resignFirstResponder];
}
#pragma mark searchbar

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self dismissKeyboard];
    [self.history addObject:self.searchBar.text];
    [self.tableViewHistory reloadData];
    ItemListViewController * controller=[[ItemListViewController alloc]initWithInput:self.searchBar.text];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)searchFromHistoryWithInput:(NSString*)input{
    [self dismissKeyboard];
    ItemListViewController * controller=[[ItemListViewController alloc]initWithInput:input];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
