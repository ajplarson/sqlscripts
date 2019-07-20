DROP DATABASE IF EXISTS roguelikeDB;
CREATE DATABASE roguelikeDB;
USE roguelikeDB;
CREATE Table SquareContent(
    SquareContentId INT PRIMARY KEY AUTO_INCREMENT,
    valid BOOL default 1
);
CREATE Table Square (
    SquareId INT PRIMARY KEY AUTO_INCREMENT,
    SquareContentId INT NOT NULL,
    Xcoord INT NOT NULL,
    Ycoord INT NOT NULL,
    CONSTRAINT fk_Map_Square
        FOREIGN KEY (SquareContentId)
        REFERENCES SquareContent(SquareContentId)
);
CREATE Table Entity (
    EntityId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    SquareId INT NOT NULL DEFAULT 1,
    Type VARCHAR(50) NOT NULL,
    CONSTRAINT fk_Entity_Square
        FOREIGN KEY (SquareId)
        REFERENCES Square(SquareId)
);
INSERT INTO SquareContent (valid) VALUES
(0),
(1);
INSERT INTO Square (SquareContentId, Xcoord, Ycoord) VALUES
(2, 0, 0),
(2, 1, 0),
(1, 2, 0),
(2, 0, 1),
(2, 1, 1),
(2, 2, 1),
(2, 0, 2),
(2, 1, 2),
(1, 2, 2);
INSERT INTO Entity (Name, SquareId, Type) VALUES
('Shrek', 5, 'Hero');