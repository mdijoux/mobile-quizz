#import "ViewController.h"
#import "Question.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
	if (self = [super initWithNibName:nibName bundle:nibBundle]) {
        Question *question1 = [[Question alloc] init];
        [question1 setCompteur:0];
        [question1 setEnonce:@"4+4?"];
        [question1 setReponse:@"8"];
        [question1 setDifficulte:NO];
        
        Question *question2 = [[Question alloc] init];
        [question2 setCompteur:0];
        [question2 setEnonce:@"1+1?"];
        [question2 setReponse:@"2"];
        [question2 setDifficulte:NO];

        Question *question3 = [[Question alloc] init];
        [question3 setCompteur:0];
        [question3 setEnonce:@"47 est-il premier?"];
        [question3 setReponse:@"Oui"];
        [question3 setDifficulte:YES];

        questions = [[NSArray arrayWithObjects: question1, question2, question3, nil] retain];
        
        [question1 release];
        [question2 release];
        [question3 release];
        
        indiceCourant = 0;
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self printQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_switchDifficile release];
    [_labelEnonce release];
    [_labelReponse release];
    [_labelDifficulte release];
    [_labelNbAffichages release];
    [questions release];
    [super dealloc];
}

- (void)printQuestion {
    Question* questionCourante = [questions objectAtIndex:indiceCourant];
    [questionCourante setCompteur:[questionCourante getCompteur] + 1];
    
    [self.labelEnonce setText:[questionCourante getEnonce]];
    [self.labelReponse setText:@""];
    [self.labelDifficulte setText:[NSString stringWithFormat:@"%d",[questionCourante getDifficulte]]];
    [self.labelNbAffichages setText:[NSString stringWithFormat:@"%d",[questionCourante getCompteur]]];
}

- (IBAction)afficherReponse:(id)sender {
    [self.labelReponse setText:[[questions objectAtIndex:indiceCourant] getReponse]];
}

- (IBAction)questionPrecedente:(id)sender {
    do {
        indiceCourant -= 1;
        if (indiceCourant < 0) indiceCourant += [questions count];
    } while ([[questions objectAtIndex:indiceCourant] getDifficulte] && ![self.switchDifficile isOn]);
    [self printQuestion];
}

- (IBAction)questionSuivante:(id)sender {
    do {
        indiceCourant = (indiceCourant + 1) % [questions count];
    } while ([[questions objectAtIndex:indiceCourant] getDifficulte] && ![self.switchDifficile isOn]);
    [self printQuestion];
}


@end
