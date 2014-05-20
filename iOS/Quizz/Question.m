#import "Question.h"

@implementation Question


- (id) initWithTitre:(NSString*)unTitre reponse:(NSString*)uneReponse difficulte:(BOOL)uneDifficulte {
	if (self = [super init]) {
		enonce = [unTitre copy];
		reponse = [uneReponse copy];
        difficulte = uneDifficulte;
		compteur = 0;
	}
	return self;
}


- (NSString*)getEnonce
{
    return enonce;
}

- (void)setEnonce:(NSString *)unEnonce
{
    if (unEnonce != enonce)
    {
        [enonce release];
        enonce = [unEnonce copy];
    }
}

- (NSString*)getReponse
{
    return reponse;
}

- (void)setReponse:(NSString*)uneReponse
{
    if (reponse != uneReponse)
    {
        [reponse release];
        reponse = [uneReponse copy];
    }
}

- (BOOL)getDifficulte
{
    return difficulte;
}

- (void)setDifficulte:(BOOL)uneDifficulte
{
    difficulte = uneDifficulte;
}

- (int)getCompteur
{
    return compteur;
}

- (void)setCompteur:(int)uneValeur
{
    compteur = uneValeur;
}

- (void)dealloc
{
    [enonce release];
    [reponse release];
    [super dealloc];
}

@end
