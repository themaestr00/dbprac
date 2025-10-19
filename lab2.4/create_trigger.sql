-- Триггер проверяет, есть ли у группы, которой мы назначаем пару,
-- пара в это время с пересекающейся четностью

CREATE OR REPLACE FUNCTION public.trg_group_overlap_check()
RETURNS trigger AS
$BODY$
DECLARE
	lesson_to_add RECORD;
BEGIN
	SELECT day, parity, scheduled_start, scheduled_end
	INTO lesson_to_add
	FROM lesson l
	WHERE l.id = NEW.lesson_id;

	IF NOT FOUND THEN
		RAISE EXCEPTION 'Lesson with id = % not found', NEW.lesson_id;
	END IF;

	IF EXISTS (
		SELECT *
		FROM lesson_group lg
		JOIN lesson old_lesson ON old_lesson.id = lg.lesson_id
		WHERE lg.group_id = NEW.group_id
		AND lg.lesson_id != NEW.lesson_id
		AND old_lesson.day = lesson_to_add.day
		AND (
			old_lesson.parity = 'all'
			OR lesson_to_add.parity = 'all'
			OR old_lesson.parity = lesson_to_add.parity
		)
		AND timerange(lesson_to_add.scheduled_start, lesson_to_add.scheduled_end)
			&& timerange(old_lesson.scheduled_start, old_lesson.scheduled_end)
	) THEN
		RAISE EXCEPTION 'Group % has already a lesson on %, parity %, time %-%',
		NEW.group_id, lesson_to_add.day, lesson_to_add.parity,
		lesson_to_add.scheduled_start, lesson_to_add.scheduled_end;
	END IF;

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS group_overlap_check ON lesson_group;
CREATE TRIGGER group_overlap_check
BEFORE INSERT OR UPDATE ON lesson_group
FOR EACH ROW
EXECUTE FUNCTION trg_group_overlap_check();

-- Автоматически заполняет регистрацию на курс текущим семестром
CREATE OR REPLACE FUNCTION public.trg_fill_current_term()
RETURNS trigger AS
$BODY$
DECLARE
	curr smallint;
BEGIN
	IF NEW.term IS NULL THEN
		SELECT es.term
		INTO curr
		FROM student s
		JOIN educational_status es ON es.id = s.status_id
		WHERE s.id = NEW.student_id;

		NEW.term := curr;
	END IF;

	RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS fill_current_term ON course_registration;
CREATE TRIGGER fill_current_term
BEFORE INSERT ON course_registration
FOR EACH ROW
EXECUTE FUNCTION trg_fill_current_term();
