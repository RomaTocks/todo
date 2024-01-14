CREATE OR REPLACE FUNCTION set_timestamp_field()
    RETURNS TRIGGER AS
$$
BEGIN
    IF tg_op = 'INSERT' THEN
        new.created_at := current_timestamp at time zone 'Europe/Minsk';
    END IF;
    IF tg_op = 'UPDATE' THEN
        new.updated_at := current_timestamp at time zone 'Europe/Minsk';
    end if;
    RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER users_trigger BEFORE INSERT OR UPDATE ON users
    FOR EACH ROW
EXECUTE FUNCTION set_timestamp_field();

CREATE OR REPLACE TRIGGER users_additional_trigger BEFORE INSERT OR UPDATE ON users_additional
    FOR EACH ROW
EXECUTE FUNCTION set_timestamp_field();

CREATE OR REPLACE TRIGGER task_list_trigger BEFORE INSERT OR UPDATE ON task_list
    FOR EACH ROW
EXECUTE FUNCTION set_timestamp_field();

CREATE OR REPLACE TRIGGER task_trigger BEFORE INSERT OR UPDATE ON task
    FOR EACH ROW
EXECUTE FUNCTION set_timestamp_field();
