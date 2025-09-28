CREATE TABLE GeneralTable (
    id SERIAL PRIMARY KEY,
    -- Клиенты
    client_id INT NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    birth_date DATE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    -- Карты
    card_id INT NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    card_type VARCHAR(30) NOT NULL CHECK (card_type IN ('Дебетовая', 'Для выплат', 'Универсальная', 'Валютная')),
    vin_code CHAR(16) UNIQUE NOT NULL,
    valid_until_month INT NOT NULL CHECK (valid_until_month BETWEEN 1 AND 12),
    valid_until_year INT NOT NULL,
    -- Кредиты
    credit_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    credit_issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    monthly_rate DECIMAL(5,2) NOT NULL,
    monthly_payment DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    -- Переводы
    transfer_id INT NOT NULL,
    sender_card_id INT NOT NULL,
    receiver_card_id INT NOT NULL,
    transfer_amount DECIMAL(12,2) NOT NULL,
    transfer_date TIMESTAMP NOT NULL,
    transfer_status VARCHAR(20) NOT NULL,
    -- Депозиты
    deposit_id INT NOT NULL,
    deposit_type VARCHAR(50) NOT NULL CHECK (deposit_type IN ('Срочный', 'До востребования', 'Накопительный')),
    deposit_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    deposit_start_date DATE NOT NULL,
    deposit_end_date DATE NOT NULL
);

-- Удаление общей таблици

DROP TABLE GeneralTable