//
//  GRViewController.m
//  GitReference
//
//  Created by Justin Huntington on 4/27/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

@interface GRViewController ()

@end

@implementation GRViewController

static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Add scrollView to main view.
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.contentInset = UIEdgeInsetsMake(20, 15, 20, 15);
    [self.view addSubview:scrollView];
    
    //add title to scrollview
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
    title.backgroundColor = [UIColor grayColor];
    [scrollView addSubview:title];
    
    CGFloat top = 20 + margin *3;
    
    
    //Iterate items in gitCommands
    for (NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *commandLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top, self.view.frame.size.width, 20)];
        commandLabel.font = [UIFont boldSystemFontOfSize:18];
        commandLabel.text = command;
        [scrollView addSubview:commandLabel];
        
        top += (20 + margin);
        
        
        UILabel *referenceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, top, self.view.frame.size.width, 17)];
        referenceLabel.font = [UIFont systemFontOfSize:14];
        referenceLabel.text = reference;
        [scrollView addSubview:referenceLabel];
        
        top += (15 + margin *2);
        
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                              context:nil];
    
    return bounding.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
