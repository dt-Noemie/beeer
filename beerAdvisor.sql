DROP DATABASE IF EXISTS BeerAdvisor;
CREATE DATABASE IF NOT EXISTS BeerAdvisor;

DROP TABLE IF EXISTS Categorie;
CREATE TABLE IF NOT EXISTS Categorie
(
    idCategorie INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nomCategorie VARCHAR(255),
    description_categorie VARCHAR(255)
);

DROP TABLE IF EXISTS TypeBiere;
CREATE TABLE IF NOT EXISTS TypeBiere 
(
    idType INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomType VARCHAR(255),
    descriptionType VARCHAR(255)
);

DROP TABLE IF EXISTS Utilisateur;
CREATE TABLE IF NOT EXISTS Utilisateur
(
    idUtilisateur INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomUtilisateur VARCHAR(255),
    prenomUtilisateur VARCHAR(255),
    peudo VARCHAR(255),
    email VARCHAR(255),
    motDePasse VARCHAR(255),
    dateNaissance DATE,
    dateInscription DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    imageUtilisateur BLOB, 
    administrateur TINYINT(1) NOT NULL
);

DROP TABLE IF EXISTS Abonnement;
CREATE TABLE IF NOT EXISTS Abonnement
(
    idAbonnement INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idUtilisateur INT(11) NOT NULL, 
    idUtilisateurSuivi INT(11) NOT NULL, 
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
    FOREIGN KEY (idUtilisateurSuivi) REFERENCES Utilisateur(idUtilisateur) 
);

DROP TABLE IF EXISTS Pays;
CREATE TABLE IF NOT EXISTS Pays
(
    idPays INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomPays VARCHAR(255)
);

DROP TABLE IF EXISTS Biere;
CREATE TABLE IF NOT EXISTS Biere 
(
    idBiere INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idCategorie INT(11) NOT NULL,
    idType INT(11) NOT NULL,
    nomBiere VARCHAR(255),
    descriptionBiere VARCHAR(255),
    imageBiere BLOB,
    idPays INT(11),
    cereale VARCHAR(255),
    houblon VARCHAR(255),
    processusBrassage VARCHAR(255),
    amertume INT(11),
    limpidite INT(11),
    calorie INT(11),
    glucide INT(11),
    carateristiqueBiere VARCHAR(255),
    FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie),
    FOREIGN KEY (idType) REFERENCES TypeBiere(idType),
    FOREIGN KEY (idPays) REFERENCES Pays(idPays)
);

DROP TABLE IF EXISTS Commentaire;
CREATE TABLE IF NOT EXISTS Commentaire
(
    idCommentaire INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idBiere INT(11) NOT NULL,
    idUtilisateur INT(11) NOT NULL,
    commentaire VARCHAR(255),
    dateCommentaire DATE,
    imageCommentaire BLOB,
    FOREIGN KEY (idBiere) REFERENCES Biere(idBiere),
    FOREIGN KEY (idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

DROP TABLE IF EXISTS Note;
CREATE TABLE IF NOT EXISTS Note
(
    idNote INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    note INT(5),
    idBiere INT(11) NOT NULL,
    FOREIGN KEY (idBiere) REFERENCES Biere(idBiere)
);




