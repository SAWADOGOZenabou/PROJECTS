



/*==============================================================*/
/* Table : ANALYSEMEDICAL                                       */
/*==============================================================*/
create table ANALYSEMEDICAL 
(
   IDANALYSEMEDICAL     integer                        not null,
   IDMEDECIN            integer                        not null,
   IDTECHNICIEN         integer                        not null,
   DATEANALYSEMEDICAL   date                           not null,
   DESIGNATIONANALYSEMEDICAL char(20)                       not null,
   constraint PK_ANALYSEMEDICAL primary key (IDANALYSEMEDICAL)
);

/*==============================================================*/
/* Table : ANTECEDENT                                           */
/*==============================================================*/
create table ANTECEDENT 
(
   IDANTECEDENT         integer                        not null,
   IDPATIENT            integer                        not null,
   DATEDEBUTANTECEDENT  date                           not null,
   DATEFINANTECEDENT    date                           not null,
   DESCRIPTIONANTECEDENT char(20)                       not null,
   constraint PK_ANTECEDENT primary key (IDANTECEDENT)
);

/*==============================================================*/
/* Table : CARTEABONNEMENT                                      */
/*==============================================================*/
create table CARTEABONNEMENT 
(
   IDCARTEABONNEMENT    integer                        not null,
   IDENTREPRISEABONNEE  integer                        not null,
   IDPATIENT            integer                        not null,
   DATEABONNEMENT       date                           not null,
   constraint PK_CARTEABONNEMENT primary key (IDCARTEABONNEMENT)
);

/*==============================================================*/
/* Table : CHAMBRE                                              */
/*==============================================================*/
create table CHAMBRE 
(
   IDCHAMBRE            integer                        not null,
   NUMLIT               integer                        not null,
   DATE_HOSPITALISATION               date                           not null,
   constraint PK_CHAMBRE primary key (IDCHAMBRE)
);

/*==============================================================*/
/* Table : CONSULTATION                                         */
/*==============================================================*/
create table CONSULTATION 
(
   IDCONSULTATION       integer                        not null,
   IDPATIENT            integer                        not null,
   IDORDONNANCE         integer                        null,
   IDMEDECIN            integer                        not null,
   TYPECONSULTATION     char(20)                       not null,
   DATECONSULTATION     date                           not null,
   DATERENDEZ_VOUS      date                           not null,
   DESCRIPTIONCONSULTATION char(60)                       not null,
   constraint PK_CONSULTATION primary key (IDCONSULTATION)
);

/*==============================================================*/
/* Table : DOSSIERMEDICAL                                       */
/*==============================================================*/
create table DOSSIERMEDICAL 
(
   IDDOSSIERMEDICAL     integer                        not null,
   TENSIONPATIENT       integer                        not null,
   TEMPERATUREPATIENT   integer                        not null,
   POIDSPATIENT         float                          not null,
   NOMBREENFANT         integer                        not null,
   DATE_DOSSIERMEDICAL               date                           not null,
   constraint PK_DOSSIERMEDICAL primary key (IDDOSSIERMEDICAL)
);

/*==============================================================*/
/* Table : ENTREPRISEABONNEE                                    */
/*==============================================================*/
create table ENTREPRISEABONNEE 
(
   IDENTREPRISEABONNEE  integer                        not null,
   NOMENTREPRISE        char(20)                       not null,
   ADRESSENTREPRISE     char(20)                       not null,
   constraint PK_ENTREPRISEABONNEE primary key (IDENTREPRISEABONNEE)
);

/*==============================================================*/
/* Table : MEDECIN                                              */
/*==============================================================*/
create table MEDECIN 
(
   IDMEDECIN            integer                        not null,
   NOMMEDECIN           char(20)                       not null,
   PRENOMMEDECIN        char(20)                       not null,
   SPECIALITEMEDECIN    char(20)                       not null,
   ADRESSMEDECIN        char(20)                       not null,
   TELMEDECIN           integer                        not null,
   constraint PK_MEDECIN primary key (IDMEDECIN)
);

/*==============================================================*/
/* Table : MODESORTIE                                           */
/*==============================================================*/
create table MODESORTIE 
(
   IDMODESORTIE         integer                        not null,
   DATESORTIE           date                           not null,
   TYPESORTIE           char(20)                       not null,
   constraint PK_MODESORTIE primary key (IDMODESORTIE)
);

/*==============================================================*/
/* Table : ORDONNANCE                                           */
/*==============================================================*/
create table ORDONNANCE 
(
   IDORDONNANCE         integer                        not null,
   IDCONSULTATION       integer                        not null,
   DATEORDONNANCE       date                           not null,
   DETAILLESORDONNANCE  char(70)                       not null,
   constraint PK_ORDONNANCE primary key (IDORDONNANCE)
);

/*==============================================================*/
/* Table : PATIENT                                              */
/*==============================================================*/
create table PATIENT 
(
   IDPATIENT            integer                        not null,
   IDDOSSIERMEDICAL     integer                        not null,
   IDCHAMBRE            integer                        not null,
   IDMODESORTIE         integer                        not null,
   IDRECU               integer                        not null,
   NOMPATIENT           char(20)                       not null,
   PRENOM               char(20)                       not null,
   DATENAISSANCE        date                           not null,
   SEXE                 char(1)                        not null,
   TEL1                 integer                        not null,
   TEL2                 integer                        not null,
   PROFESSION           char(20)                       not null,
   STATUTMATRIMONIAL    char(20)                       not null,
   constraint PK_PATIENT primary key (IDPATIENT)
);

/*==============================================================*/
/* Table : RECU                                                 */
/*==============================================================*/
create table RECU 
(
   IDRECU               integer                        not null,
   IDPATIENT            integer                        null,
   TYPERECU             char(20)                       not null,
   MONTANTRECU          char(20)                       not null,
   DATERECU             date                           not null,
   constraint PK_RECU primary key (IDRECU)
);

/*==============================================================*/
/* Table : RESULTATSANALYSE                                     */
/*==============================================================*/
create table RESULTATSANALYSE 
(
   IDRESULTATSANALYSE   integer                        not null,
   IDANALYSEMEDICAL     integer                        not null,
   DESCRIPTIONRESULTATSANALYSE char(50)                       not null,
   constraint PK_RESULTATSANALYSE primary key (IDRESULTATSANALYSE)
);

/*==============================================================*/
/* Table : TECHNICIEN                                           */
/*==============================================================*/
create table TECHNICIEN 
(
   IDTECHNICIEN         integer                        not null,
   NOMTECHNICIEN        char(20)                       not null,
   PRENOMTECHNICIEN     char(20)                       not null,
   TELTECHNICIEN        integer                        not null,
   constraint PK_TECHNICIEN primary key (IDTECHNICIEN)
);

alter table ANALYSEMEDICAL
   add constraint FK_ANALYSEM_EFFECTUER_TECHNICI foreign key (IDTECHNICIEN)
      references TECHNICIEN (IDTECHNICIEN)
      on update restrict
      on delete restrict;

alter table ANALYSEMEDICAL
   add constraint FK_ANALYSEM_PRESCRIRE_MEDECIN foreign key (IDMEDECIN)
      references MEDECIN (IDMEDECIN)
      on update restrict
      on delete restrict;

alter table ANTECEDENT
   add constraint FK_ANTECEDE_POSSEDER_PATIENT foreign key (IDPATIENT)
      references PATIENT (IDPATIENT)
      on update restrict
      on delete restrict;

alter table CARTEABONNEMENT
   add constraint FK_CARTEABO_APPARTENI_ENTREPRI foreign key (IDENTREPRISEABONNEE)
      references ENTREPRISEABONNEE (IDENTREPRISEABONNEE)
      on update restrict
      on delete restrict;

alter table CARTEABONNEMENT
   add constraint FK_CARTEABO_DETENIR_PATIENT foreign key (IDPATIENT)
      references PATIENT (IDPATIENT)
      on update restrict
      on delete restrict;

alter table CONSULTATION
   add constraint FK_CONSULTA_AVOIR1_PATIENT foreign key (IDPATIENT)
      references PATIENT (IDPATIENT)
      on update restrict
      on delete restrict;

alter table CONSULTATION
   add constraint FK_CONSULTA_AVOIR3_ORDONNAN foreign key (IDORDONNANCE)
      references ORDONNANCE (IDORDONNANCE)
      on update restrict
      on delete restrict;

alter table CONSULTATION
   add constraint FK_CONSULTA_FAIRE_MEDECIN foreign key (IDMEDECIN)
      references MEDECIN (IDMEDECIN)
      on update restrict
      on delete restrict;

alter table ORDONNANCE
   add constraint FK_ORDONNAN_AVOIR4_CONSULTA foreign key (IDCONSULTATION)
      references CONSULTATION (IDCONSULTATION)
      on update restrict
      on delete restrict;

alter table PATIENT
   add constraint FK_PATIENT_CONSERNER_MODESORT foreign key (IDMODESORTIE)
      references MODESORTIE (IDMODESORTIE)
      on update restrict
      on delete restrict;

alter table PATIENT
   add constraint FK_PATIENT_DISPOSER_DOSSIERM foreign key (IDDOSSIERMEDICAL)
      references DOSSIERMEDICAL (IDDOSSIERMEDICAL)
      on update restrict
      on delete restrict;

alter table PATIENT
   add constraint FK_PATIENT_OCCUPER_CHAMBRE foreign key (IDCHAMBRE)
      references CHAMBRE (IDCHAMBRE)
      on update restrict
      on delete restrict;

alter table PATIENT
   add constraint FK_PATIENT_PAYER2_RECU foreign key (IDRECU)
      references RECU (IDRECU)
      on update restrict
      on delete restrict;

alter table RECU
   add constraint FK_RECU_PAYER_PATIENT foreign key (IDPATIENT)
      references PATIENT (IDPATIENT)
      on update restrict
      on delete restrict;

alter table RESULTATSANALYSE
   add constraint FK_RESULTAT_AVOIR2_ANALYSEM foreign key (IDANALYSEMEDICAL)
      references ANALYSEMEDICAL (IDANALYSEMEDICAL)
      on update restrict
      on delete restrict;

