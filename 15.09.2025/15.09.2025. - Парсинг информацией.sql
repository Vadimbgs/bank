INSERT INTO Clients (client_id, last_name, first_name, middle_name, birth_date, phone, email)
VALUES
(1, 'Иванов', 'Иван', 'Иванович', '1985-03-15', '+79991234567', 'ivanov@example.com'),
(2, 'Петров', 'Петр', 'Петрович', '1990-07-20', '+79997654321', 'petrov@example.com'),
(3, 'Сидорова', 'Анна', 'Викторовна', '1995-11-05', '+79990001122', 'sidorova@example.com');


INSERT INTO Cards (card_id, client_id, issue_date, expiry_date, card_type, vin_code, valid_until_month, valid_until_year)
VALUES
(1, 1, '2020-01-01', '2025-01-01', 'Дебетовая', '1234567890123456', 1, 2025),
(2, 1, '2021-06-15', '2026-06-15', 'Универсальная', '2345678901234567', 6, 2026),
(3, 2, '2019-03-10', '2024-03-10', 'Валютная', '3456789012345678', 3, 2024),
(4, 3, '2022-09-01', '2027-09-01', 'Для выплат', '4567890123456789', 9, 2027);

INSERT INTO Credits (credit_id, client_id, card_id, product_name, issue_date, due_date, monthly_rate, monthly_payment, total_amount)
VALUES
(1, 1, 1, 'Смартфон', '2021-02-01', '2023-02-01', 1.5, 5000, 120000),
(2, 2, 3, 'Ноутбук', '2020-05-15', '2022-05-15', 1.2, 7000, 168000),
(3, 3, 4, 'Телевизор', '2022-10-01', '2024-10-01', 1.8, 4000, 96000);


INSERT INTO Transfers (transfer_id, sender_card_id, receiver_card_id, amount, transfer_date, status)
VALUES
(1, 1, 3, 15000, '2023-03-10 14:30:00', 'Выполнен'),
(2, 2, 4, 5000, '2023-04-05 09:20:00', 'Выполнен'),
(3, 3, 1, 7000, '2023-05-01 18:10:00', 'Отменен');


INSERT INTO Deposits (deposit_id, client_id, card_id, deposit_type, amount, interest_rate, start_date, end_date)
VALUES
(1, 1, 2, 'Срочный', 200000, 5.5, '2022-01-01', '2023-01-01'),
(2, 2, 3, 'До востребования', 50000, 2.0, '2021-06-01', '2023-06-01'),
(3, 3, 4, 'Накопительный', 120000, 4.0, '2023-02-15', '2024-02-15');






