
CREATE TABLE Angajati (
    Angajat_ID NUMBER PRIMARY KEY,
    Nume VARCHAR2(50),
    Prenume VARCHAR2(50),
    Telefon VARCHAR2(20),
    Tip_Angajat VARCHAR2(50),
    Salariu NUMBER
);


CREATE TABLE Comenzi (
    Comanda_ID NUMBER PRIMARY KEY,
    Angajat_ID NUMBER,
    Data_Comanda TIMESTAMP,
    FOREIGN KEY (Angajat_ID) REFERENCES Angajati(Angajat_ID)
);


CREATE TABLE ProduseAlimentare (
    Produs_ID NUMBER PRIMARY KEY,
    Nume_Produs VARCHAR2(50),
    Descriere VARCHAR2(255)
);


CREATE TABLE Clienti (
    Client_ID NUMBER PRIMARY KEY,
    Nume VARCHAR2(50),
    Prenume VARCHAR2(50),
    Adresa VARCHAR2(255),
    Card_Cumparaturi NUMBER
);


CREATE TABLE CarduriCumparaturi (
    Card_ID NUMBER PRIMARY KEY,
    Client_ID NUMBER,
    FOREIGN KEY (Client_ID) REFERENCES Clienti(Client_ID)
);


CREATE TABLE Ture (
    Tura_ID NUMBER PRIMARY KEY,
    Angajat_ID NUMBER,
    Data_Tura DATE,
    Probleme VARCHAR2(255),
    FOREIGN KEY (Angajat_ID) REFERENCES Angajati(Angajat_ID)
);


CREATE TABLE MeniuriPromotionale (
    Meniu_ID NUMBER PRIMARY KEY,
    Nume_Meniu VARCHAR2(50),
    Data_Inceput DATE,
    Data_Sfarsit DATE
);


CREATE TABLE MeniuriRegulate (
    Meniu_ID NUMBER PRIMARY KEY,
    Nume_Meniu VARCHAR2(50),
    Ora_Inceput TIMESTAMP,
    Ora_Sfarsit TIMESTAMP
);


CREATE TABLE ProduseInComenzi (
    Comanda_ID NUMBER,
    Produs_ID NUMBER,
    Cantitate NUMBER,
    PRIMARY KEY (Comanda_ID, Produs_ID),
    FOREIGN KEY (Comanda_ID) REFERENCES Comenzi(Comanda_ID),
    FOREIGN KEY (Produs_ID) REFERENCES ProduseAlimentare(Produs_ID)
);


INSERT INTO Angajati VALUES (1, 'Popescu', 'Ion', '123456789', 'Receptie', 2000);
INSERT INTO Angajati VALUES (2, 'Ionescu', 'Maria', '987654321', 'Bucatar', 2500);
INSERT INTO Angajati VALUES (3, 'Georgescu', 'Ana', '555123456', 'Receptie', 2200);
INSERT INTO Angajati VALUES (4, 'Popa', 'Mihai', '111222333', 'Manager', 3000);

select * from Comenzi;

INSERT INTO Comenzi VALUES (2, 1, TO_TIMESTAMP('2022-01-01 06:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (3, 1, TO_TIMESTAMP('2022-03-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (4, 1, TO_TIMESTAMP('2022-05-05 07:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (5, 1, TO_TIMESTAMP('2022-02-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (6, 1, TO_TIMESTAMP('2022-03-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (7, 3, TO_TIMESTAMP('2022-01-22 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Comenzi VALUES (8, 3, TO_TIMESTAMP('2022-01-18 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO ProduseAlimentare VALUES (1, 'Chicken Mole', 'Preparat mexican cu pui intr-un sos de ciocolata');
INSERT INTO ProduseAlimentare VALUES (2, 'Sopapilla', 'Desert mexican cu aluat prajit si miere');
INSERT INTO ProduseAlimentare VALUES (3, 'Burger Kong', 'Burger special pentru evenimentul King Kong');
INSERT INTO ProduseAlimentare VALUES (4, 'Dragon Cake', 'Pr?jitur? tematic? cu dragon pentru Anul Nou Chinezesc');


INSERT INTO Clienti VALUES (1, 'Popescu', 'Ana', 'Str. Primaverii, nr. 1', 123);
INSERT INTO Clienti VALUES (2, 'Ionescu', 'Radu', 'Str. Soarelui, nr. 10', NULL);
INSERT INTO Clienti VALUES (3, 'Georgescu', 'Ion', 'Str. Florilor, nr. 5', 456);
INSERT INTO Clienti VALUES (4, 'Popa', 'Andreea', 'Str. Luna, nr. 20', 789);

INSERT INTO CarduriCumparaturi VALUES (1, 1);
INSERT INTO CarduriCumparaturi VALUES (2, 2);


INSERT INTO Ture VALUES (1, 1, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 'Intarziere');
INSERT INTO Ture VALUES (2, 2, TO_DATE('2022-04-01', 'YYYY-MM-DD'), 'Eroare in preparare');
INSERT INTO Ture VALUES (3, 3, TO_DATE('2022-04-15', 'YYYY-MM-DD'), 'Echipament defect');
INSERT INTO Ture VALUES (4, 4, TO_DATE('2022-04-30', 'YYYY-MM-DD'), 'Stoc insuficient');
select * from Ture;
select distinct data_tura, nume, prenume, tura from Angajati, Ture where data_tura in (DATE'2022-04-01',DATE'2022-04-15') and upper(NUME) LIKE'%I%' order by data_tura ASC;


INSERT INTO MeniuriPromotionale VALUES (1, 'Inapoi la scoala', TO_DATE('2022-09-01', 'YYYY-MM-DD'), TO_DATE('2022-09-30', 'YYYY-MM-DD'));
INSERT INTO MeniuriPromotionale VALUES (2, 'Gratar de vara', TO_DATE('2022-06-01', 'YYYY-MM-DD'), TO_DATE('2022-08-31', 'YYYY-MM-DD'));
INSERT INTO MeniuriPromotionale VALUES (3, 'Halloween Special', TO_DATE('2022-10-15', 'YYYY-MM-DD'), TO_DATE('2022-10-31', 'YYYY-MM-DD'));
INSERT INTO MeniuriPromotionale VALUES (4, 'Craciun Festiv', TO_DATE('2022-12-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));
select * from MeniuriPromotionale;

INSERT INTO MeniuriRegulate VALUES (1, 'Mic dejun', TO_DATE('2022-01-01 06:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MeniuriRegulate VALUES (2, 'Pranz', TO_DATE('2022-01-01 11:01:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MeniuriRegulate VALUES (3, 'Cina', TO_DATE('2022-01-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MeniuriRegulate VALUES (4, 'Meniu special weekend', TO_DATE('2022-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 23:59:59', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO ProduseInComenzi VALUES (4, 1, 7);
INSERT INTO ProduseInComenzi VALUES (2, 2, 10);
INSERT INTO ProduseInComenzi VALUES (2, 1, 1);
INSERT INTO ProduseInComenzi VALUES (3, 3, 1);
INSERT INTO ProduseInComenzi VALUES (4, 4, 2);
drop table ProduseInComenzi;




-- 1. Care dintre angaja?i lucreaz? cel mai mult (cine ia cele mai multe comenzi)?

SELECT Nume, Prenume, NumarComenzi
FROM (
    SELECT A.Nume, A.Prenume, COUNT(C.Comanda_ID) AS NumarComenzi
    FROM Angajati A
    JOIN Comenzi C ON A.Angajat_ID = C.Angajat_ID
    GROUP BY A.Nume, A.Prenume
    ORDER BY NumarComenzi DESC
)
WHERE ROWNUM = 1;



-- 2. Care sunt cele mai aglomerate momente ale zilei ?i cele mai aglomerate zile ale s?pt?mânii?
SELECT Ora_Comanda, Ziua_Saptamanii, NumarComenzi
FROM (
    SELECT TO_CHAR(Data_Comanda, 'HH24:MI') AS Ora_Comanda,
           TO_CHAR(Data_Comanda, 'DAY') AS Ziua_Saptamanii,
           COUNT(*) AS NumarComenzi
    FROM Comenzi
    GROUP BY TO_CHAR(Data_Comanda, 'HH24:MI'), TO_CHAR(Data_Comanda, 'DAY')
    ORDER BY NumarComenzi DESC
)
WHERE ROWNUM = 1;


-- 3. Care sunt cele mai populare produse alimentare?
SELECT Nume_Produs, NumarComenzi
FROM (
    SELECT PA.Nume_Produs, COUNT(PC.Produs_ID) AS NumarComenzi
    FROM ProduseAlimentare PA
    JOIN ProduseInComenzi PC ON PA.Produs_ID = PC.Produs_ID
    GROUP BY PA.Nume_Produs
    ORDER BY NumarComenzi DESC
)
WHERE ROWNUM = 1;

-- 4. Care sunt angajatii care au luat comenzi de la clientii din luna ianuarie, 2022?
SELECT Nume, Prenume
FROM Angajati
JOIN Comenzi ON Angajati.Angajat_ID = Comenzi.Angajat_ID
WHERE EXTRACT(MONTH FROM Comenzi.Data_Comanda) = 1 AND EXTRACT(YEAR FROM Comenzi.Data_Comanda) = 2022;

-- 5. Care sunt clientii care au carduri de cump?r?turi?
SELECT Nume, Prenume
FROM Clienti
JOIN CarduriCumparaturi ON Clienti.Client_ID = CarduriCumparaturi.Client_ID;

-- 6. Ce produse s-au vandut pe comenzile din luna mai, 2021?
SELECT DISTINCT PA.Nume_Produs
FROM ProduseAlimentare PA
JOIN ProduseInComenzi PC ON PA.Produs_ID = PC.Produs_ID
JOIN Comenzi C ON PC.Comanda_ID = C.Comanda_ID
WHERE EXTRACT(MONTH FROM C.Data_Comanda) = 5 AND EXTRACT(YEAR FROM C.Data_Comanda) = 2021;
ALTER TABLE Comenzi
ADD NUME_MENIU VARCHAR2(255);
ALTER TABLE Comenzi
ADD Data_Comanda DATE;
ALTER TABLE Comenzi
ADD Client_ID NUMBER;
ALTER TABLE Comenzi
ADD CONSTRAINT fk_Client_ID FOREIGN KEY (Client_ID) REFERENCES Clienti(Client_ID);

INSERT INTO Comenzi VALUES (9, 1, TO_TIMESTAMP('2021-05-05 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Chicken Mole', 1);
INSERT INTO Comenzi VALUES (10, 1, TO_TIMESTAMP('2021-05-05 07:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Chicken Mole', 2);

INSERT INTO ProduseInComenzi VALUES (9, 1, 1);
INSERT INTO ProduseInComenzi VALUES (10, 1, 1);

-- 7. Ce con?ineau meniurile promo?ionale stabilite cu ocazia Anului Nou-2022?
SELECT MeniuriPromotionale.Nume_Meniu, MeniuriPromotionale.Data_Inceput, MeniuriPromotionale.Data_Sfarsit
FROM MeniuriPromotionale
WHERE TO_CHAR(MeniuriPromotionale.Data_Inceput, 'YYYY') = '2022';







