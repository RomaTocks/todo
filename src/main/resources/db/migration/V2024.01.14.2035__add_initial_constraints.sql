ALTER TABLE IF EXISTS users_additional DROP CONSTRAINT  foreign_key_users;

ALTER TABLE IF EXISTS users_additional
    ADD CONSTRAINT foreign_key_users FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE IF EXISTS task DROP CONSTRAINT foreign_key_task_list;

ALTER TABLE IF EXISTS task
    ADD CONSTRAINT foreign_key_task_list FOREIGN KEY (task_list_id) REFERENCES task_list(id);
