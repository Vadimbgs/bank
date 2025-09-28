UPDATE Clients
SET 
    last_name = CASE client_id 
        WHEN 1 THEN 'Иванов'
        WHEN 2 THEN 'Петров'
        WHEN 3 THEN 'Смирнова'
        ELSE last_name 
    END,
    first_name = CASE client_id 
        WHEN 1 THEN 'Александр'
        WHEN 2 THEN 'Дмитрий'
        WHEN 3 THEN 'Екатерина'
        ELSE first_name 
    END
WHERE client_id IN (1, 2, 3);


UPDATE Credits
SET 
    last_name = CASE client_id 
        WHEN 1 THEN 'Иванов'
        WHEN 2 THEN 'Петров'
        WHEN 3 THEN 'Смирнова'
        ELSE last_name 
    END,
    first_name = CASE client_id 
        WHEN 1 THEN 'Александр'
        WHEN 2 THEN 'Дмитрий'
        WHEN 3 THEN 'Екатерина'
        ELSE first_name 
    END
WHERE client_id IN (1, 2, 3);