//
//  TGCameraAuthorizationViewController.m
//  TGCameraViewController
//
//  Created by Bruno Tortato Furtado on 20/09/14.
//  Copyright (c) 2014 Tudo Gostoso Internet. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "TGCameraAuthorizationViewController.h"
#import "TGCameraFunctions.h"

@interface TGCameraAuthorizationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *step1Label;
@property (weak, nonatomic) IBOutlet UILabel *step2Label;
@property (weak, nonatomic) IBOutlet UILabel *step3Label;
@property (weak, nonatomic) IBOutlet UILabel *step4Label;

@property (strong, nonatomic) IBOutlet UIButton *updateSettingsBtn;


- (IBAction)closeTapped;

@end



@implementation TGCameraAuthorizationViewController

- (instancetype)init
{
    return [super initWithNibName:NSStringFromClass(self.class) bundle:[NSBundle bundleForClass:self.class]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //  For some reason, localization doesn't seem to work correctly for this pod
    //  just stick the strings in here for now
    
    NSString *prefLanguage = [NSLocale preferredLanguages][0];
    if ([prefLanguage rangeOfString:@"it"].location != NSNotFound) {
        _titleLabel.text = @"Consenti L’accesso alle foto";
        _subtitleLabel.text = @"Clicca sul bottone sottostante per accedere alle impostazioni. Poi abita la fotocamera per consentire ad EatOpine di utilizzarla";
        [_updateSettingsBtn setTitle:@"Aggiorna le impostazioni" forState:UIControlStateNormal];
    }
    else {
        //_titleLabel.text = TGLocalizedString(@"TGCameraViewController-Title");
        //_subtitleLabel.text = TGLocalizedString(@"TGCameraViewController-Subtitle");
    }

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark -
#pragma mark - Actions

- (IBAction)closeTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clickMeTapped:(id)sender {
    NSLog(@"Clicked!");

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

}


@end