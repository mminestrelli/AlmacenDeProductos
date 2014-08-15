//
//  ItemDetailViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/14/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ItemDetailViewController.h"


@interface ItemDetailViewController ()
@property (nonatomic,strong) SearchItem* item;
@end

@implementation ItemDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andItem:(SearchItem*)item
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.item=item;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //load url into webview
    NSString *strURL = self.item.permalink;
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webViewDescription loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
