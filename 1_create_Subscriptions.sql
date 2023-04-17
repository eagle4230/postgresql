-- Таблица для сущности Подписка
-- true - подписка на пользователя, false - подписка на сообщество

CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  subscription_type BOOLEAN,
  subscription_id INT NOT NULL,
  subscription_at TIMESTAMP
);
