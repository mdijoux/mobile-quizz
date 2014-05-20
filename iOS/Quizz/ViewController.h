#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSArray *questions;
	int indiceCourant;
}

@property (retain, nonatomic) IBOutlet UISwitch *switchDifficile;
@property (retain, nonatomic) IBOutlet UILabel *labelEnonce;
@property (retain, nonatomic) IBOutlet UILabel *labelReponse;
@property (retain, nonatomic) IBOutlet UILabel *labelDifficulte;
@property (retain, nonatomic) IBOutlet UILabel *labelNbAffichages;

- (IBAction)afficherReponse:(id)sender;
- (IBAction)questionPrecedente:(id)sender;
- (IBAction)questionSuivante:(id)sender;

@end
