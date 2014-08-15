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
#import "ItemDetailViewController.h"
#define kProductCellHeight 72

@interface ItemListViewController ()<SearchManagerDelegate>

@property (nonatomic,strong) NSArray *items;
@property (nonatomic,strong)SearchManager *manager;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSString* input;

@end

@implementation ItemListViewController

- (id)initWithInput:(NSString*)input
{
    self = [super init];
    if (self) {
        self.input=input;
        //[input stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
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
    [self setTitle:@"Resultados"];
    [self startFetchingItemsWithInput];
}

#pragma mark - Notification Observer
- (void)startFetchingItemsWithInput
{
    [self loadingHud];
    [self.manager fetchItemsWithInput:self.input];
}

#pragma mark - SearchManagerDelegate
- (void)didReceiveItems:(NSArray *)items
{
    self.items = items;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self finishingHUD];
    });

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
    return kProductCellHeight;
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
    NSString* soldQty=[NSString stringWithFormat:@"%d%@",item.sold_quantity,@" vendidos." ];
    [cell.labelPrice setText:[NSString stringWithFormat:@"%@",item.price ]];
    [cell.labelSubtitle setText:soldQty];
    if([item.thumbnail class]!=[NSNull class]){
        NSURL *url = [NSURL URLWithString:item.thumbnail];
        NSData *data = [NSData dataWithContentsOfURL:url];
        cell.imageViewPreview.image= [UIImage imageWithData:data];
    }
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchItem *item = self.items[indexPath.row];
    ItemDetailViewController * detailView= [[ItemDetailViewController alloc] initWithNibName:nil bundle:nil andItem:item ];
    [self.navigationController pushViewController:detailView animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark progress hud animation
-(void)finishingHUD{
    HUD.mode = MBProgressHUDModeText;
	HUD.labelText = @"Listo!";
    [HUD hide:YES afterDelay:1];
    //[HUD hide:YES];
}
-(void) loadingHud{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
	// Configure for text only and offset down
	HUD.mode = MBProgressHUDModeIndeterminate;
	HUD.labelText = @"Conectando";
	HUD.removeFromSuperViewOnHide = YES;
    
}

@end
