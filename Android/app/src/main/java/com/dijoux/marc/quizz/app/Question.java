package com.dijoux.marc.quizz.app;

public class Question {
    // private String enonce;
    // private String reponse;
    private int enonce;
    private int reponse;
    private boolean difficile;
    private int compteur;

    // public Question(String enonce, String reponse, boolean difficile) {
    public Question(int enonce, int reponse, boolean difficile) {
        this.enonce = enonce;
        this.reponse = reponse;
        this.difficile = difficile;
        this.compteur = 0;
    }

    public int getEnonce() { return enonce; }
    public int getReponse() { return reponse; }
    public boolean estDifficile() { return difficile; }
    public int getCompteur() { return compteur; }
    public void incrCompteur() { compteur++; }
}