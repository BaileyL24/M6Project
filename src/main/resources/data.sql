-- Sample data for task manager

-- Priorities
INSERT INTO priorities (level) VALUES ('LOW') ON CONFLICT DO NOTHING;
INSERT INTO priorities (level) VALUES ('MEDIUM') ON CONFLICT DO NOTHING;
INSERT INTO priorities (level) VALUES ('HIGH') ON CONFLICT DO NOTHING;

-- Users
-- Users (salt + hash placeholders)
INSERT INTO users (username, salt, password_hash) VALUES
('alice', 'AAAAAAAAAAAAAAAAAAAAAA==', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB='),
('bob',   'AAAAAAAAAAAAAAAAAAAAAA==', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB='),
('carol', 'AAAAAAAAAAAAAAAAAAAAAA==', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB='),
('dave',  'AAAAAAAAAAAAAAAAAAAAAA==', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB='),
('eve',   'AAAAAAAAAAAAAAAAAAAAAA==', 'BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB=');

-- Tasks (round-robin priorities)
INSERT INTO tasks (title, description, status, due_date, priority_id)
VALUES
('Task 1', 'Description for Task 1', 'PENDING', '2025-10-01', 1),
('Task 2', 'Description for Task 2', 'IN_PROGRESS', '2025-10-02', 2),
('Task 3', 'Description for Task 3', 'COMPLETED', '2025-10-03', 3),
('Task 4', 'Description for Task 4', 'PENDING', '2025-10-04', 1),
('Task 5', 'Description for Task 5', 'IN_PROGRESS', '2025-10-05', 2),
('Task 6', 'Description for Task 6', 'COMPLETED', '2025-10-06', 3),
('Task 7', 'Description for Task 7', 'PENDING', '2025-10-07', 1),
('Task 8', 'Description for Task 8', 'IN_PROGRESS', '2025-10-08', 2),
('Task 9', 'Description for Task 9', 'COMPLETED', '2025-10-09', 3),
('Task 10', 'Description for Task 10', 'PENDING', '2025-10-10', 1);

-- Subtasks (1–3 per task, mix of statuses)
INSERT INTO subtasks (title, status, task_id) VALUES
('Subtask 1.1', 'PENDING', 1),
('Subtask 1.2', 'IN_PROGRESS', 1),
('Subtask 2.1', 'COMPLETED', 2),
('Subtask 3.1', 'PENDING', 3),
('Subtask 3.2', 'COMPLETED', 3),
('Subtask 4.1', 'PENDING', 4),
('Subtask 5.1', 'IN_PROGRESS', 5),
('Subtask 6.1', 'COMPLETED', 6),
('Subtask 6.2', 'PENDING', 6),
('Subtask 7.1', 'PENDING', 7),
('Subtask 7.2', 'IN_PROGRESS', 7),
('Subtask 7.3', 'COMPLETED', 7),
('Subtask 8.1', 'IN_PROGRESS', 8),
('Subtask 9.1', 'COMPLETED', 9),
('Subtask 10.1', 'PENDING', 10);

-- User-Task associations (round robin)
INSERT INTO user_tasks (user_id, task_id) VALUES
(1, 1), (2, 1),
(2, 2), (3, 2),
(3, 3), (4, 3),
(4, 4), (5, 4),
(5, 5), (1, 5),
(1, 6), (2, 6),
(2, 7), (3, 7),
(3, 8), (4, 8),
(4, 9), (5, 9),
(5, 10), (1, 10);