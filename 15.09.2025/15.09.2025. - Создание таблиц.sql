CREATE TABLE Clients (
    client_id INT PRIMARY KEY,         -- PK
    last_name VARCHAR(50) NOT NULL,    -- Фамилия
    first_name VARCHAR(50) NOT NULL,   -- Имя
    middle_name VARCHAR(50),           -- Отчество
    birth_date DATE NOT NULL,          -- Дата рождения
    phone VARCHAR(20) UNIQUE NOT NULL,          -- Номер телефона
    email VARCHAR(100) UNIQUE NOT NULL          -- Email
);


CREATE TABLE Cards (
    card_id INT PRIMARY KEY,           
    client_id INT NOT NULL,            -- FK на клиента
    issue_date DATE NOT NULL,          -- Дата выдачи
    expiry_date DATE NOT NULL,         -- Срок окончания действия
    card_type VARCHAR(30) CHECK (card_type IN ('Дебетовая','Для выплат','Универсальная','Валютная')),
    vin_code CHAR(16) UNIQUE NOT NULL, -- Уникальный код карты
    valid_until_month INT CHECK (valid_until_month BETWEEN 1 AND 12) NOT NULL,
    valid_until_year INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);


CREATE TABLE Credits (
    credit_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    card_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,   -- Название товара
    issue_date DATE NOT NULL,             -- Дата выдачи
    due_date DATE NOT NULL,               -- Срок окончания выплаты
    monthly_rate DECIMAL(5,2) NOT NULL,            -- Месячный процент
    monthly_payment DECIMAL(10,2) NOT NULL,        -- Сумма в месяц
    total_amount DECIMAL(12,2) NOT NULL,           -- Общая сумма кредита
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id)
);


CREATE TABLE Transfers (
    transfer_id INT PRIMARY KEY,
    sender_card_id INT NOT NULL,       -- Карта отправителя
    receiver_card_id INT NOT NULL,     -- Карта получателя
    amount DECIMAL(12,2) NOT NULL,     -- Сумма перевода
    transfer_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- Дата и время перевода
    status VARCHAR(20) DEFAULT 'Выполнен' NOT NULL,  -- Статус: выполнен, отменен, в обработке
    FOREIGN KEY (sender_card_id) REFERENCES Cards(card_id),
    FOREIGN KEY (receiver_card_id) REFERENCES Cards(card_id)
);


CREATE TABLE Deposits (
    deposit_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    card_id INT NOT NULL,
    deposit_type VARCHAR(50) CHECK (deposit_type IN ('Срочный','До востребования','Накопительный')) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,        -- Сумма вклада
    interest_rate DECIMAL(5,2) NOT NULL,  -- Процентная ставка
    start_date DATE NOT NULL,             -- Дата открытия
    end_date DATE NOT NULL,                        -- Дата окончания (NULL для "до востребования")
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (card_id) REFERENCES Cards(card_id)
);



