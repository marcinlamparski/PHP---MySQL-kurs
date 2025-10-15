CREATE TABLE Samochody (
    id_samochodu INT AUTO_INCREMENT PRIMARY KEY,
    marka VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    przebieg INT,
    nr_rejestracyjny VARCHAR(15) NOT NULL
);

CREATE TABLE Kierowcy (
    id_kierowcy INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(30) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    pesel CHAR(11) NOT NULL
);

CREATE TABLE Zlecenia (
    id_zlecenia INT AUTO_INCREMENT PRIMARY KEY,
    data_zlecenia DATE NOT NULL,
    id_kierowcy INT,
    id_samochodu INT,
    opis TEXT,
    FOREIGN KEY (id_kierowcy) REFERENCES Kierowcy(id_kierowcy),
    FOREIGN KEY (id_samochodu) REFERENCES Samochody(id_samochodu)
);


-- Tabela Samochody
INSERT INTO Samochody (marka, model, przebieg, nr_rejestracyjny) VALUES
  ('Toyota', 'Corolla', '120000', 'WZ 2347L'),
  ('Volkswagen', 'Golf', '88000', 'KR 6536H'),
  ('Fiat', 'Ducato', '60000', 'PO 9854S'),
  ('Renault', 'Kangoo', '180000', 'WA 2124P'),
  ('Peugeot', 'Partner', '240000', 'GD 5643T'),
  ('Opel', 'Vivaro', '6000', 'LU 3453C'),
  ('Ford', 'Transit','300000', 'SC 9812J'),
  ('Mercedes', 'Sprinter','2000', 'DW 6721M');

-- Tabela Kierowcy
INSERT INTO Kierowcy (imie, nazwisko, pesel) VALUES
  ('Piotr', 'Nowak', '92041705714'),
  ('Anna', 'Kowalska', '85032712358'),
  ('Marek', 'Wiśniewski', '83060588729'),
  ('Jan', 'Wójcik', '90102594263'),
  ('Katarzyna', 'Mazur', '95030564728'),
  ('Michał', 'Lewandowski', '93081575314'),
  ('Ewa', 'Kaczmarek', '86032442610'),
  ('Tomasz', 'Czarnecki', '79122558376');

-- Tabela Zlecenia
INSERT INTO Zlecenia (data_zlecenia, id_kierowcy, id_samochodu, opis) VALUES
  ('2025-10-01', 1, 1, 'Dostawa dokumentów do klienta A'),
  ('2025-10-02', 2, 2, 'Transport paczek Warszawa-Poznań'),
  ('2025-10-03', 3, 3, 'Odbiór przesyłek z magazynu południowego'),
  ('2025-10-04', 4, 4, 'Dostawa sprzętu elektronicznego'),
  ('2025-10-05', 5, 5, 'Dostarczenie materiałów reklamowych'),
  ('2025-10-06', 6, 6, 'Przewóz próbek farmaceutycznych'),
  ('2025-10-07', 7, 7, 'Transport odzieży do hurtowni'),
  ('2025-10-08', 8, 8, 'Dowóz dokumentów do oddziału Gdańsk');
