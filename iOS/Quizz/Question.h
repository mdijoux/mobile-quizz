#import <Foundation/Foundation.h>

@interface Question : NSObject
{
    NSString *enonce;
    NSString *reponse;
    BOOL difficulte;
    int compteur;
}

- (id)initWithTitre:(NSString*)unTitre reponse:(NSString*)uneReponse difficulte:(BOOL)uneDifficulte;
- (NSString*)getEnonce;
- (void)setEnonce:(NSString*)unEnonce;
- (NSString*)getReponse;
- (void)setReponse:(NSString*)uneReponse;
- (BOOL)getDifficulte;
- (void)setDifficulte:(BOOL)uneDifficulte;
- (int)getCompteur;
- (void)setCompteur:(int)uneValeur;

@end
