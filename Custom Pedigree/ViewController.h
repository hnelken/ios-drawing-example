//
//  ViewController.h
//  Custom Pedigree
//
//  Created by Harry Nelken on 12/1/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PedigreeView.h"

@interface ViewController : UIViewController

@property (nonatomic) BOOL healthy;
@property (nonatomic) BOOL horizontal;
@property (nonatomic) BOOL male;
@property (nonatomic) BOOL line;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *maleButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *femaleButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *lineButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *statusButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *dirButton;

@property (strong, nonatomic) IBOutlet PedigreeView *pedView;

- (IBAction)tappedMale:(id)sender;
- (IBAction)tappedFemale:(id)sender;
- (IBAction)tappedStatus:(id)sender;
- (IBAction)tappedLine:(id)sender;
- (IBAction)tappedDir:(id)sender;

- (IBAction)singleTap:(id)sender;
- (IBAction)panGesture:(id)sender;

@end

