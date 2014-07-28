//
//  ProductListViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/25/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductTableViewCell.h"

@interface ProductListViewController (){
    UITableView * _tableViewStoreHouse;
    ADPStoreHouse* _house;
    ADPProduct* _productReceivedInNotification;
}
@property (nonatomic,strong) ADPProduct* productReceivedInNotification;
@property (strong, nonatomic) IBOutlet UITableView *tableViewStoreHouse;
@property (strong,nonatomic) ADPStoreHouse* house;
@end

@implementation ProductListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andStoreHouse:(ADPStoreHouse*) storeHouse{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.house=storeHouse;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- Table
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * tableIdentifier = @"ProductTableViewCell";
    ProductTableViewCell * productCell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if (productCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ProductTableViewCell" owner:self options:nil];
        productCell = [nib objectAtIndex:0];
    }
 
    ADPProduct* current=[self.house getProducts][indexPath.row ];
    productCell.labeltitle.text=current.title;
    productCell.labelSubtitle.text=current.subtitle;
    productCell.labelPrice.text=[NSString stringWithFormat:@"%f",current.price];
    productCell.imageViewPreview.image=current.image;
   
    return productCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.house amountOfProductsStocked];
}

#pragma mark -Notification handling
/* Save notification is sent when the user selects the option save in ProductImageViewController the selector handles the object received adding it to the store house */
-(void) saveNotificationHandle:(NSNotification*) notification{
    NSDictionary * usrInfo=[notification userInfo];
    [self.house addProduct: [usrInfo objectForKey:@"producto" ]];
    //Mock add
    //[self.house addProduct:[[ADPProduct alloc] initWithTitle:@"hola" code:2 subtitle:@"sub" description:@"desc" price:23 andImage:nil]];
}
@end
