//
//  DataBaseViewController.m
//  Project2
//
//  Created by Jason Bentley on 5/14/13.
//  Copyright (c) 2013 Jason Bentley. All rights reserved.
//

#import "DataBaseViewController.h"
#import "DatabaseInfo.h"

@interface DataBaseViewController ()

@end

@implementation DataBaseViewController

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
    
    DatabaseInfo *robot1 = [[DatabaseInfo alloc] initWithRobotName:@"HAL9000" info:@"a computer-based agent capable of spoken language dialogue, face detection, reasoning and emotion processing (Stork 1997)."];
    
    DatabaseInfo *robot2 = [[DatabaseInfo alloc] initWithRobotName:@"SHRDLU" info:@"a natural language understanding system for a simulated robotic arm manipulating blocks (Winograd 1972)."];
    
    DatabaseInfo *robot3 = [[DatabaseInfo alloc] initWithRobotName:@"HERMES" info:@"a humanoid robot that carried out guided museum tours for and extended period of time (Bischoff and Graefe 2002)."];
    
    DatabaseInfo *robot4 = [[DatabaseInfo alloc] initWithRobotName:@"MARVIN" info:@"gives tours around the lab where it was developed (Koch, Jung, Wettach, Nemeth and Berns 2008)."];
    
    robotArray = [[NSArray alloc] initWithObjects: robot1, robot2, robot3, robot4, nil];

    
//    NSLog(@"%d", [robotArray count]);
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//count items in array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [robotArray count];
}

//load reusable cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
                    
                
                DatabaseInfo *info= [robotArray objectAtIndex:indexPath.row];
                cell.textLabel.text =  info.robot;
     
   
    return cell;
}




@end
