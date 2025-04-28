DROP TABLE Author;
DROP TABLE Publisher;
DROP TABLE Book;
DROP TABLE Stock;


CREATE TABLE Author  (
AuthorID INTEGER NOT NULL, 
PRIMARY KEY (AuthorID),
Surname VARCHAR(50),
Forename VARCHAR(50)
);

CREATE TABLE Publisher  (
PublisherID INTEGER NOT NULL, 
PRIMARY KEY (PublisherID),
Name VARCHAR(50),
Address VARCHAR(50),
Postcode VARCHAR(10),
City VARCHAR(50)
);

CREATE TABLE Book
(
BookID INTEGER NOT NULL, 
Title VARCHAR(50),
BookAuthor INTEGER NOT NULL,
BookPublisher INTEGER NOT NULL,
Pages integer,
Prize decimal,
Published VARCHAR(50),
PRIMARY KEY (BookID),
FOREIGN KEY (BookAuthor) REFERENCES 
Author(AuthorID),
FOREIGN KEY (BookPublisher) REFERENCES 
Publisher(PublisherID)
);


CREATE TABLE Stock (
StockID INTEGER NOT NULL, 
StockBook INTEGER NOT NULL,
InStock integer,
PRIMARY KEY (StockID),
FOREIGN KEY (StockBook)
	REFERENCES Book (BookID)
);

INSERT INTO Author VALUES (201,'Saville','Ernesto');
INSERT INTO Author VALUES (202,'Adams','Arthur');
INSERT INTO Author VALUES (203,'Schmidt','Abigale');
INSERT INTO Author VALUES (204,'Weinstein-Welle','Marie');
INSERT INTO Author VALUES (205,'Nordqvist','Arvid');
INSERT INTO Author VALUES (206,'van Holstein','Theodore');
INSERT INTO Author VALUES (207,'Annett','Josephine');

INSERT INTO Publisher VALUES (301,'Taylor & Wells','17 Pine Road', 'SN11017', 'Little Town');
INSERT INTO Publisher VALUES (302,'Black Wolf Publishing','100 A Hillside Way', 'BF10071', 'Dullville');
INSERT INTO Publisher VALUES (303,'Info Press','2 High Street', 'CD05020', 'Forestwood');
INSERT INTO Publisher VALUES (304,'Classics4you','10 Old Road', 'YT98100', 'Creek-on-Trent');

INSERT INTO Book VALUES (101,'Three Bearded Men and the Sea',202, 304,333,21.8,'1983-12-04');
INSERT INTO Book VALUES (102,'The Ghost of the Moor',202, 301,310,23.1,'1980-12-01');
INSERT INTO Book VALUES (103,'How Computers Work',205, 303,70,16.8,'1999-03-14');
INSERT INTO Book VALUES (104,'The Hound and other short stories',204, 302,475,35.5,'2000-01-01');
INSERT INTO Book VALUES (105,'Lets Play Pocer And Chess',201, 303,125,10.5,'2006-04-19');
INSERT INTO Book VALUES (106,'My life as I see it',204, 301,782,55.2,'1990-10-10');
INSERT INTO Book VALUES (107,'Upside-down and other children''s stories',204, 301,245,20.8,'1970-11-20');
INSERT INTO Book VALUES (108,'The Winter Everlasting',204, 301,1156,46.8,'1975-12-01');
INSERT INTO Book VALUES (109,'There and Never Back Again',206, 302,370,29.9,'1998-09-30');
INSERT INTO Book VALUES (110,'The Crime that never was',202, 304,555,16.4,'2004-03-10');
INSERT INTO Book VALUES (111,'Learn to Knit',207, 303,75,10.2,'1995-11-02');

INSERT INTO Stock VALUES (1001,101,175);
INSERT INTO Stock VALUES (1002,102,252);
INSERT INTO Stock VALUES (1003,103,15);
INSERT INTO Stock VALUES (1004,104,244);
INSERT INTO Stock VALUES (1005,105,53);
INSERT INTO Stock VALUES (1006,106,102);
INSERT INTO Stock VALUES (1007,107,10);
INSERT INTO Stock VALUES (1008,109,5);
INSERT INTO Stock VALUES (1009,110,0);
INSERT INTO Stock VALUES (1010,111,34);
