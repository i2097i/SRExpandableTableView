//
//  SRExpandableTableViewController.h
//  SRExpandableTableView
//
//  Created by Scot Reichman on 8/8/13.
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SRExpandableTableViewController : UITableViewController

/**
 *  This is the datasource initialization method.
 *
 *  contentArray should be an instance of NSArray. 
 *  Each object in the array should be an array of 
 *  objects representing the content in each given
 *  section.
 *
 *  labelsArray is simply an array of strings that
 *  will be used as section labels.
 **/
-(void)setSRExpandableTableViewControllerWithContent:(NSArray *)contentArray andSectionLabels:(NSArray *)labelsArray;

/**
 *  Method for getting the content for a given section.
 *  Use it to get information in the child class
 **/
-(NSArray *)getSectionContentForSection:(NSInteger)section;

/**
 *  Method for hiding or showing the arrows.
 **/
-(void)setArrowsHidden:(BOOL)arrowsHidden;

/**
 *  Method for changing whether or not the tableView
 *  allows multple sections to be opened at the same
 *  time.
 **/
-(void)setMultiExpanded:(BOOL)multiExpanded;

@end
