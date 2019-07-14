use trackit;




-- Inner join
-- SELECT 
--     Task.TaskId,
--     Task.Title,
--     TaskStatus.Name
-- FROM TaskStatus
-- INNER JOIN Task ON TaskStatus.TaskStatusId = Task.TaskStatusId
-- WHERE TaskStatus.IsResolved = 1;

-- SELECT
--     Project.Name,
--     Worker.FirstName,
--     Worker.LastName,
--     Task.Title
-- FROM Project
-- INNER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
-- INNER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
-- INNER JOIN Task ON ProjectWorker.ProjectId = Task.ProjectId
--     AND ProjectWorker.WorkerId = Task.WorkerId
-- WHERE Project.ProjectId = 'game-goodboy';

-- select * from task 
-- -- inner join taskstatus on 
-- -- 	task.taskstatusid = taskstatus.taskstatusid
-- where taskstatusid is null;


-- SELECT
--     Task.TaskId,
--     Task.Title,
--     IFNULL(Task.TaskStatusId, 0) AS TaskStatusId,
--     IFNULL(TaskStatus.Name, '[None]') AS StatusName
-- FROM Task
-- LEFT OUTER JOIN TaskStatus 
--     ON Task.TaskStatusId = TaskStatus.TaskStatusId;
    
-- SELECT
--     Project.Name ProjectName, -- An alias makes this more clear.
--     Worker.FirstName,
--     Worker.LastName
-- FROM Project
-- LEFT OUTER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
-- LEFT OUTER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId;

-- SELECT
--     Project.Name ProjectName,
--     Worker.FirstName,
--     Worker.LastName
-- FROM Project
-- LEFT OUTER JOIN ProjectWorker ON Project.ProjectId = ProjectWorker.ProjectId
-- LEFT OUTER JOIN Worker ON ProjectWorker.WorkerId = Worker.WorkerId
-- WHERE ProjectWorker.WorkerId IS NULL; -- Throws out projects with workers.

-- SELECT
--     parent.TaskId ParentTaskId,
--     child.TaskId ChildTaskId,
--     CONCAT(parent.Title, ': ', child.Title) Title
-- FROM Task parent
-- INNER JOIN Task child ON parent.TaskId = child.ParentTaskId;

SELECT
    IFNULL(s.Name, '[None]') StatusName,
    COUNT(t.TaskId) TaskCount
FROM Task t
LEFT OUTER JOIN TaskStatus s ON t.TaskStatusId = s.TaskStatusId
GROUP BY s.Name
ORDER BY s.Name;

show status;
