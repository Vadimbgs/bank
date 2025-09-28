SELECT 
    c.client_id,
    c.last_name,
    c.first_name
FROM Clients c
JOIN Cards ca ON c.client_id = ca.client_id
GROUP BY c.client_id, c.last_name, c.first_name
HAVING SUM(CASE WHEN ca.card_type = 'Дебетовая' THEN 1 ELSE 0 END) > 0;