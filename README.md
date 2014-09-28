ExpandableTableViewExample
==========================

This is a subclass of a ```UITableViewController``` that allows for expandable/collapsable sections.

To use it, simply import the ```SRExpandableTableViewController.h``` and ```SRExpandableTableViewController.m``` 
files into your xCode project, create a UITableViewController and make it a subclass of the
```SRExpandableTableViewController``` class. Initlialize the datasource with the 

```
-(void)setSRExpandableTableViewControllerWithContent:(NSArray *)contentArray andSectionLabels:(NSArray *)labelsArray;
```

method and that's it!

Note: I did utlize some QuartzCore stuff in the class so be sure to link the QuartzCore framework to your
project.
