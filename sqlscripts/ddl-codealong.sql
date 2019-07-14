-- This approach destroys the existing database and starts from scratch each time you run it.
-- It-s good for new development, but won-t work for existing
--   databases that must be altered but left intact.
DROP DATABASE IF EXISTS TrackIt;

CREATE DATABASE TrackIt;

-- Make sure we-re in the correct database before we add schema.
USE TrackIt;

CREATE TABLE Project (
    ProjectId CHAR(50) PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    Summary VARCHAR(2000) NULL,
    DueDate DATE NOT NULL,
    IsActive BOOL NOT NULL DEFAULT 1
);

CREATE TABLE Worker (
    WorkerId INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

CREATE TABLE ProjectWorker (
    ProjectId CHAR(50) NOT NULL,
    WorkerId INT NOT NULL,
    PRIMARY KEY pk_ProjectWorker (ProjectId, WorkerId),
    FOREIGN KEY fk_ProjectWorker_Project (ProjectId)
        REFERENCES Project(ProjectId),
    FOREIGN KEY fk_ProjectWorker_Worker (WorkerId)
        REFERENCES Worker(WorkerId)
);

CREATE TABLE Task (
    TaskId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Details TEXT NULL,
    DueDate DATE NOT NULL,
    EstimatedHours DECIMAL(5, 2) NULL,
    ProjectId CHAR(50) NOT NULL,
    WorkerId INT NOT NULL,
    FOREIGN KEY fk_Task_ProjectWorker (ProjectId, WorkerId)
        REFERENCES ProjectWorker(ProjectId, WorkerId)
);

insert into Worker (WorkerId, FirstName, LastName)
	values (1, 'Rosemonde', 'Featherbie');
insert into Worker (FirstName, LastName) 
	values ('Kingsly', 'Besantie');
insert into worker (firstname, lastname) values
	('Goldi', 'Pilipets'),
    ('Dorey', 'Rulf'),
    ('panchito','ashtonhurst');
    
-- select * from worker;

insert into project (projectid, `Name`, duedate) 
	values ('db-milestone', 'Database Material', '2018-12-31');
    
insert into projectworker (projectid, workerid)
	values ('db-milestone', 2);
    
insert into project (projectid, `Name`, DueDate) 
	values ('kitchen', 'remodeling', '2025-07-15');
insert into projectworker (projectid, workerid) values
	('db-milestone', 1),
    ('kitchen', 2),
    ('db-milestone', 3),
    ('db-milestone', 4);
    
update project set
	summary = 'seventy two i dont know what to type',
    duedate = '2012-10-10'
    where projectid = 'db-milestone';

update worker set 
	lastname = 'jebediah'
    where workerid = 2;
set sql_safe_updates = 0;
update project set 
	isactive = 0
    where duedate between '2017-01-01' and '2017-12-31' 
    and isactive = 1;
set sql_safe_updates = 1;


set sql_safe_updates = 0;
delete from task
where workerid = 2;
delete from projectworker
where workerid = 2;
delete from worker
where lastname = 'jebediah';

set sql_safe_updates = 1;

select * from worker;