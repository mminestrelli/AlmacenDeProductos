//
//  ItemListViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ItemListViewController.h"
#import "ProductTableViewCell.h"
#import "SearchItem.h"
#import "SearchManager.h"
#import "SearchCommunicator.h"
@interface ItemListViewController ()<SearchManagerDelegate>
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,strong)SearchManager *manager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ItemListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.manager = [[SearchManager alloc] init];
    self.manager.communicator = [[SearchCommunicator alloc] init];
    self.manager.communicator.delegate = self.manager;
    self.manager.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startFetchingItems:)
                                                 name:@"kCLAuthorizationStatusAuthorized"
                                               object:nil];
    [self startFetchingItems:nil];
}

#pragma mark - Notification Observer
- (void)startFetchingItems:(NSNotification *)notification
{
    NSString* input=@"hola";
    [self.manager fetchItemsWithInput:input];
}

#pragma mark - SearchManagerDelegate
- (void)didReceiveItems:(NSArray *)items
{
    self.items = items;
    [self.tableView reloadData];
}

- (void)fetchingItemsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.items.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductTableViewCell * cell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    SearchItem *item = self.items[indexPath.row];
    [cell.labeltitle setText:item.title];
    [cell.labelSubtitle setText:@"hola"];
    [cell.labelPrice setText:[NSString stringWithFormat:@"%d",item.price] ];
    NSURL *url = [NSURL URLWithString:item.thumbnail];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageViewPreview.image= [UIImage imageWithData:data];
    
    
    
    
    return cell;
}

@end
