//
//  ProductListViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/25/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductTableViewCell.h"

@interface ProductListViewController ()
@property (nonatomic,strong) ADPProduct* productReceivedInNotification;
@property (strong, nonatomic) IBOutlet UITableView *tableViewStoreHouse;
@property (strong,nonatomic) ADPStoreHouse* house;
@end

@implementation ProductListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.house=[[ADPStoreHouse alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveNotificationHandle:) name:@"productSave" object:self.productReceivedInNotification];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableViewStoreHouse.delegate = self;
    self.tableViewStoreHouse.dataSource = self;
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Mis Publicaciones"];

    //Mock add - Deprecated
    [self.house addProduct:[[ADPProduct alloc] initWithTitle:@"MacBook Pro retina 17 inch" code:54 subtitle:@"sub" description:@"Retina display: 13.3-inch (diagonal) LED-backlit display with IPS technology; 2560-by-1600 resolution at 227 pixels per inch with support for millions of colors" price:21399 andImage:[UIImage imageNamed: @"gallery2_2256.jpg"]]];
    [self.house addProduct:[[ADPProduct alloc] initWithTitle:@"producto2" code:55 subtitle:@"sub" description:@"desc" price:2343 andImage:[UIImage imageNamed: @"gallery1_2256.jpg"]]];
    
    //Load from file
    self.house.products = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getCacheFilePath]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Table

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * tableIdentifier = @"ProductTableViewCell";
    ProductTableViewCell * productCell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (productCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:self options:nil];
        productCell = [nib objectAtIndex:0];
    }
 
    ADPProduct* current=self.house.products[indexPath.row ];
    productCell.labeltitle.text=current.title;
    productCell.labelSubtitle.text=current.subtitle;
    //productCell.labelPrice.text=@"$";
    //productCell.labelPrice.text= [current getFormattedPriceString];
    productCell.labelPrice.text=[NSString stringWithFormat:@"%f",current.price];
    productCell.imageViewPreview.image=current.image;
   
    return productCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.house amountOfProductsStocked];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableViewStoreHouse setEditing:editing animated:YES];
    if (editing) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // If row is deleted, remove it from the list.
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *) [[UIApplication sharedApplication] delegate];
       // [self removeObjectFromListAtIndex:indexPath.row];
        [self.tableViewStoreHouse deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ADPProduct* product= self.house.products[indexPath.row ];
    ProductDetailViewController * detailView= [[ProductDetailViewController alloc] initWithNibName:nil bundle:nil andProduct:product];
    [self.navigationController pushViewController:detailView animated:YES];
    [self.tableViewStoreHouse deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -Notification handling
/* Save notification is sent when the user selects the option save in ProductImageViewController the selector handles the object received adding it to the store house. If a new item was added data is reloaded  */
-(void) saveNotificationHandle:(NSNotification*) notification{
    NSDictionary * usrInfo=[notification userInfo];
    [self.house addProduct: [usrInfo objectForKey:@"producto" ]];
    [self.tableViewStoreHouse reloadData];
    
    //Save to file
    [NSKeyedArchiver archiveRootObject:self.house.products toFile:[self getCacheFilePath]];
}

-(NSString*) getCacheFilePath{
    /*Library folder, where you store configuration files and writable databases that you also want to keep around, but you don't want the user to be able to mess with through iTunes*/
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *file = [libraryDirectory stringByAppendingPathComponent:@"cache.txt"];
    return file;
}

@end
