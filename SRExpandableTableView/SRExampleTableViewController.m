//
//  SRExampleTableViewController.m
//  SRExpandableTableView
//
//  Created by Scot Reichman on 8/9/13.
//  Copyright (c) 2013 i2097i. All rights reserved.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.

#import "SRExampleTableViewController.h"

@interface SRExampleTableViewController ()

@end

@implementation SRExampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
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

-(void)viewDidAppear:(BOOL)animated
{
    NSArray *sectionZeroContent = [NSArray arrayWithObjects:@"S:0 R:0",@"S:0 R:1",@"S:0 R:2", nil];
    NSArray *sectionOneContent = [NSArray arrayWithObjects:@"S:1 R:0",@"S:1 R:1",@"S:1 R:2", nil];
    NSArray *sectionTwoContent = [NSArray arrayWithObjects:@"S:2 R:0",@"S:2 R:1",@"S:2 R:2", nil];
    NSArray *sectionThreeContent = [NSArray arrayWithObjects:@"S:3 R:0",@"S:3 R:1",@"S:3 R:2", nil];
    NSArray *contentArray = [NSArray arrayWithObjects:sectionZeroContent,sectionOneContent,sectionTwoContent,sectionThreeContent, nil];
    NSArray *labelArray = [NSArray arrayWithObjects:@"Section Zero",@"Section One",@"Section Two",@"Section Three", nil];
    [self setSRExpandableTableViewControllerWithContent:contentArray andSectionLabels:labelArray];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSArray *arrayForSection = [self getSectionContentForSection:indexPath.section];
    [cell.textLabel setText:[arrayForSection objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// Everything below this is just to show how to use the different
// features of the SRExpandableTableViewController

- (IBAction)actionButtonPressed:(id)sender
{
    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Toggle Multi Expanded",@"Toggle Show Arrows", nil];
    [as setTag:0];
    [as showFromBarButtonItem:(UIBarButtonItem *)sender animated:YES];
}

#pragma mark - Action sheet delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet.tag == 0)
    {
        // Action Button Pressed
        if(buttonIndex == 0)
        {
            // Multi Expanded Pressed
            UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Select An Option:" message:@"Change whether the tableView can have only one section opened at a time or multiple." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Single",@"Multiple", nil];
            [av setTag:10];
            [av show];
        }
        else if(buttonIndex == 1)
        {
            // Show Arrows Pressed
            UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"Select An Option:" message:@"Change whether the section arrows are hidden or shown." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Show",@"Hide", nil];
            [av setTag:11];
            [av show];
        }
    }
}

#pragma mark - Alert view delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag == 10)
    {
        // Multi Expanded Option Selected
        if(buttonIndex == 1)
        {
            // Single
            [self setMultiExpanded:NO];
        }
        else if(buttonIndex == 2)
        {
            // Multiple
            [self setMultiExpanded:YES];
        }
    }
    if(alertView.tag == 11)
    {
        // Show or Hide Arrows Option Selected
        if(buttonIndex == 1)
        {
            // Show
            [self setArrowsHidden:NO];
        }
        else if(buttonIndex == 2)
        {
            // Hide
            [self setArrowsHidden:YES];
        }
    }

}
@end
