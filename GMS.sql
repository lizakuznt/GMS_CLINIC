CREATE TABLE Role (
 Role_id INT IDENTITY (1,1) PRIMARY KEY,
 NAME CHAR(10) NOT NULL
 );

CREATE TABLE LOGIN (
LOGIN_ID INT IDENTITY (1,1) PRIMARY KEY,
LOGIN VARCHAR(20) NOT NULL,
PASSWORD VARCHAR(20) NOT NULL,
Role_id INT,
FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
);

CREATE TABLE Client (
 Client_id INT IDENTITY (1,1) PRIMARY KEY,
 NAME CHAR(20) NOT NULL,
 LAST_NAME CHAR(20) NOT NULL,
 MIDDLE_NAME CHAR(20) NOT NULL,
 PAUL CHAR(1) NOT NULL
 );

CREATE TABLE Doctor (
 Doctor_id INT IDENTITY (1,1) PRIMARY KEY,
 NAME CHAR(20) NOT NULL,
 LAST_NAME CHAR(20) NOT NULL,
 MIDDLE_NAME CHAR(20) NOT NULL,
 QALIFICATION CHAR(20) NOT NULL
);

CREATE TABLE Manager (
 Manager_id INT IDENTITY (1,1) PRIMARY KEY,
 Role_id INT,
FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
);

CREATE TABLE Analyzes (
 Analyzes_id INT IDENTITY (1,1) PRIMARY KEY,
 Analyze CHAR(20) NOT NULL
);

CREATE TABLE Appointment (
Appointment_id INT IDENTITY (1,1) PRIMARY KEY,
DATE DATE NOT NULL,
Analyzes_id INT,
Doctor_id INT,
Client_id INT,
FOREIGN KEY (Analyzes_id) REFERENCES Analyzes(Analyzes_id),
FOREIGN KEY (Doctor_id) REFERENCES Doctor(Doctor_id),
FOREIGN KEY (Client_id) REFERENCES Client(Client_id)
);

CREATE TABLE Results (
Results_id  INT IDENTITY (1,1) PRIMARY KEY,
Result CHAR(30) NOT NULL,
Appointment_id INT,
FOREIGN KEY (Appointment_id) REFERENCES Appointment(Appointment_id)
);


INSERT INTO Role(NAME)
OUTPUT
inserted.NAME
VALUES 
('Doctor'),('Client'),('Manager');

INSERT INTO LOGIN(LOGIN, PASSWORD, Role_id)
OUTPUT
inserted.LOGIN, inserted.PASSWORD, inserted.Role_id
VALUES
('doctor', '1111', '1'),
('client', '2222', '2'),
('manager', '3333', '3');

INSERT INTO Client(NAME, LAST_NAME, MIDDLE_NAME, PAUL)
OUTPUT
inserted.NAME, inserted.LAST_NAME, inserted.MIDDLE_NAME, inserted.PAUL
VALUES 
('Елизавета','Кузнецова', 'Дмитриевна', 'Ж'),
('Ольга','Петровна', 'Михальченко', 'Ж'),
('Антон','Шастун', 'Андреевич',  'М');

INSERT INTO Doctor(NAME, LAST_NAME, MIDDLE_NAME, QALIFICATION)
OUTPUT
inserted.NAME, inserted.LAST_NAME, inserted.MIDDLE_NAME, inserted.QALIFICATION
VALUES 
('Михаил','Чупров', 'Сергеевич',  'Врач общей практики'),
('Екатерина','Макаровна', 'Александровна',  'Врач-терапевт'),
('Елена','Самарина', 'Алексеевна', 'Дежурный врач');

INSERT INTO Manager( Role_id)
OUTPUT
inserted.Role_id
VALUES 
('3');

INSERT INTO Analyzes(Analyze)
OUTPUT
inserted.Analyze
VALUES 
('Кровь из вены'),
('Проверка на ВИЧ');

INSERT INTO Appointment (DATE, Analyzes_id, Doctor_id, Client_id)
OUTPUT inserted.DATE, inserted.Analyzes_id, inserted.Doctor_id, inserted.Client_id
VALUES 
('2024-01-22', '2', '1', '1'),
('2024-03-12', '2', '2', '3');

INSERT INTO Results(Result, Appointment_id)
OUTPUT inserted.Result, inserted.Appointment_id
VALUES 
('Положителен', '1'),
('Отрицателен', '2');


