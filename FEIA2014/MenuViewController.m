//
//  MenuViewController.m
//  FEIA2014
//
//  Created by Ricardo Nunes de Miranda on 12/08/14.
//  Copyright (c) 2014 Ricardo Nunes de Miranda. All rights reserved.
//

#import "MenuViewController.h"

static NSString* const MENU_CELL_IDENTIFIER = @"menuCell";

@interface MenuViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.title = NSLocalizedString(@"menuTitle", @"Title of menu section");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int rows = 0;
    
    // Return the number of rows in the section.
    if(section == 0){
        // Meu calendario section
        rows = 1;
    } else if(section == 1){
        // Informações FEIA section
        rows = 6;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int section;
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:MENU_CELL_IDENTIFIER forIndexPath:indexPath];
    section = indexPath.section;
    
    if(section == 0){
        cell.textLabel.text = NSLocalizedString(@"meuCalendarioLink", @"String for 'Meu calendario' item");
    } else if(section == 1){
        
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"apresentacaoLink", @"String for 'Apresentacoes' item");
                
                break;
            case 1:
                cell.textLabel.text = NSLocalizedString(@"oficinaLink", @"String for 'Oficinas' item");
                
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"noiteLink", @"String for 'Noites FEIA' item");
                
                break;
            case 3:
                cell.textLabel.text = NSLocalizedString(@"parceiroLink", @"String for 'Parceiros' item");
                
                break;
            case 4:
                cell.textLabel.text = NSLocalizedString(@"mapaLink", @"String for 'Mapa' item");
                
                break;
            case 5:
                cell.textLabel.text = NSLocalizedString(@"contatoLink", @"String for 'Contato' item");
                
                break;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
