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

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return [searchResults count];
//        
//    } else {
//        return [recipes count];
//    }
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 71;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"CustomTableCell";
//    RecipeTableCell *cell = (RecipeTableCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    // Configure the cell...
//    if (cell == nil) {
//        cell = [[RecipeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    
//    // Display recipe in the table cell
//    Recipe *recipe = nil;
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        recipe = [searchResults objectAtIndex:indexPath.row];
//    } else {
//        recipe = [recipes objectAtIndex:indexPath.row];
//    }
//    
////    cell.nameLabel.text = recipe.name;
////    cell.thumbnailImageView.image = [UIImage imageNamed:recipe.image];
////    cell.prepTimeLabel.text = recipe.prepTime;
//    
//    return cell;
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
//        NSIndexPath *indexPath = nil;
//        Recipe *recipe = nil;
//        
//        if (self.searchDisplayController.active) {
//            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
//            recipe = [searchResults objectAtIndex:indexPath.row];
//        } else {
//            indexPath = [self.tableView indexPathForSelectedRow];
//            recipe = [recipes objectAtIndex:indexPath.row];
//        }
//        
//        //RecipeDetailViewController *destViewController = segue.destinationViewController;
//        //destViewController.recipe = recipe;
//    }
//}
//
//- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
//{
//    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
//    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
//}
//
//-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
//{
//    [self filterContentForSearchText:searchString
//                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
//                                      objectAtIndex:[self.searchDisplayController.searchBar
//                                                     selectedScopeButtonIndex]]];
//    
//    return YES;
//}
- (IBAction)botonPressed:(id)sender {
    ItemListViewController * nextViewController= [[ItemListViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:nextViewController animated:YES];
}
@end
