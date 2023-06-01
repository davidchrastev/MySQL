USE `soft_uni`;


DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
    RETURNS INT
    DETERMINISTIC
    BEGIN
    DECLARE result INT;

    SET result := (
        word REGEXP (concat('^[', set_of_letters, ']+$'))
        );

    RETURN result;
END $$;

SELECT ufn_is_word_comprised('dasviasd', 'David');