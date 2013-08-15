//
//  TVViewController.m
//  Aug15
//
//  Created by andrew rodney on 8/14/13.
//  Copyright (c) 2013 andrew rodney. All rights reserved.
//

#import "TVViewController.h"

@interface TVViewController ()

@end

@implementation TVViewController

// Insert indivual row into tableview
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    // populate a reuseable cell if available
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Create image frame and object file
    UIImage *thumbnail = [UIImage imageNamed:[pictures objectAtIndex: indexPath.row]] ;
    CGSize itemSize = CGSizeMake(40, 40);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    
    UIGraphicsBeginImageContext(itemSize);
    [thumbnail drawInRect:imageRect];
    
    // create a new cell if re-usable is not available
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //Set the text to display for the cell
    NSString *cellValue = [states objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    cell.detailTextLabel.text = [contentsSubItems objectAtIndex:indexPath.row];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext();
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //—-display “Movie List” as the header—-
    return @"Available References";
}

//—--set the number of rows in the table view—--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [states count];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    states = [[NSArray arrayWithObjects:
               @"Relay Device Numbers",
               @"Heat Rate Calculator",
               @"Turbine Efficiency",
               @"Pipe Dimensions",
               @"Flange Dimensions",
               @"Safe High Voltage Clearances",
               @"Electrical Terminology",
               @"Vibration Calculator",
               @"Flash Steam Calculator",
               nil
               ] retain];
    cellReuseIdentifier = @"states";
    
    pictures = [[NSArray arrayWithObjects:
                 @"electromagnetic_relay.png",
                 @"ts.png",
                 @"turbine.png",
                 @"pipe2.png",
                 @"flanges1.png",
                 @"lightning_bolt_md.png",
                 @"bulb.png",
                 @"vibrations.png",
                 @"steam.png",
                 nil
                 ] retain];
    cellReuseIdentifier = @"pictures";
    
    contentsSubItems = [[NSArray arrayWithObjects:
                         @"ANSI Descriptions",
                         @"Heat rate based on fuel and Power output",
                         @"Efficiency of converting fuel to power",
                         @"Commercial pipe sizes in inches",
                         @"Welding Neck Flanges in inches",
                         @"OSHA safety guidelines",
                         @"Common terms used in utility industry",
                         @"Velocity to displacement conversion",
                         @"Percentage volume of water flashing to steam",
                         nil
                         ] retain];
    cellReuseIdentifier = @"contentsSubItems";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc
{
    [states release]; [pictures release]; [contentsSubItems release]; [super dealloc];
}



@end
