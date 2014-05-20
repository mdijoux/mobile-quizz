package com.dijoux.marc.quizz.app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;


public class QuizzActivity extends Activity {

    private boolean afficherDifficile = true;
    private TextView enonce, reponse, difficulte, nbAffichages;
    private Question[] lesQuestions;
    private int currentIndex = 0;

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        enonce = (TextView) findViewById(R.id.labelEnonce);
        reponse = (TextView) findViewById(R.id.labelReponse);
        difficulte = (TextView) findViewById(R.id.labelDifficulte);
        nbAffichages = (TextView) findViewById(R.id.labelNbAffichages);

        /*
        Question q0 = new Question("1+1", "2", false);
        Question q1 = new Question("7*2", "14", false);
        Question q2 = new Question("47 est-il premier", "oui", true);
        Question q3 = new Question("Prénom du capitaine Haddock", "Archibald", true);
        lesQuestions = new Question[4];
        lesQuestions[0] = q0;
        lesQuestions[1] = q1;
        lesQuestions[2] = q2;
        lesQuestions[3] = q3;
        */
        Question Q0 = new Question(R.string.q1, R.string.r1, false);
        Question Q1 = new Question(R.string.q2, R.string.r2, false);
        Question Q2 = new Question(R.string.q3, R.string.r3, true);
        Question Q3 = new Question(R.string.q4, R.string.r4, true);
        lesQuestions = new Question[4];
        lesQuestions[0] = Q0;
        lesQuestions[1] = Q1;
        lesQuestions[2] = Q2;
        lesQuestions[3] = Q3;

        printCurrentQuestion();
    }

    public void toggleDifficulte (View v) {
        afficherDifficile = !afficherDifficile;
    }

    public void printReponse (View v) {
        reponse.setText(lesQuestions[currentIndex].getReponse());
    }

    private void printCurrentQuestion() {
        Question currentQuestion = lesQuestions[currentIndex];
        currentQuestion.incrCompteur();

        enonce.setText(currentQuestion.getEnonce());
        reponse.setText(R.string.emptyString);
        difficulte.setText(currentQuestion.estDifficile() ? getString(R.string.yes) : getString(R.string.no));
        nbAffichages.setText("" + currentQuestion.getCompteur());
    }

    public void nextQuestion (View v) {
        currentIndex = (currentIndex + 1) % lesQuestions.length;
        int start = currentIndex;
        while (!afficherDifficile && lesQuestions[currentIndex].estDifficile()) {
            currentIndex = (currentIndex + 1) % lesQuestions.length;
            if (currentIndex == start) return;
        }
        printCurrentQuestion();
    }

    private int positiveModulo(int a, int n) {
        a %= n;
        while (a < 0) a += n;
        return a;
    }

    public void previousQuestion (View v) {
        currentIndex = positiveModulo(currentIndex - 1, lesQuestions.length);
        int start = currentIndex;
        while (!afficherDifficile && lesQuestions[currentIndex].estDifficile()) {
            currentIndex = positiveModulo(currentIndex - 1, lesQuestions.length);
            if (currentIndex == start) return;
        }
        printCurrentQuestion();
    }
}
