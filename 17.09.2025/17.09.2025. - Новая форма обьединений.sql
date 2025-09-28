SELECT
    c.client_id,
    c.last_name,
    c.first_name,
    c.middle_name,
    c.birth_date,
    c.phone,
    c.email,

    -- карты
    ca.card_id,
    ca.issue_date AS card_issue_date,
    ca.expiry_date,
    ca.card_type,
    ca.vin_code,
    ca.valid_until_month,
    ca.valid_until_year

FROM Clients c
LEFT JOIN Cards ca ON c.client_id = ca.client_id;
