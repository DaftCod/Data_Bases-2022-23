# Описание сущностей

## Roles (Роли)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | VARCHAR(14) | PK |
| role | Роль | VARCHAR(10) | NOT NULL |

## User (Пользователь)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| password | Пароль пользователя | VARCHAR(255) | NOT NULL, SHA-256 |
| name | Имя | VARCHAR(30) | NOT NULL |
| role_id | Роль | NUMBER | FK, NOT NULL |
| fullname | Фамилия | VARCHAR(30) | NOT NULL |
| citizenship | Гражданство | VARCHAR(30) | NOT NULL |
| sex | Пол | BOOL | TRUE/FALSE |
| birthdate | Дата рождения | DATETIME |  |
| passport | Пасспортные данные | VARCHAR(9) | NOT NULL |

## Билет (Ticket)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| number_of_ticket | Первичный ключ | NUMBER | PK |
| price | Цена | DOUBLE | NOT NULL |
| id_passenger | ID пассажира | VARCHAR(14) | FK, NOT NULL |
| id_flight | ID рейса | NUMBER | FK, NOT NULL |

## Рейс (Flight)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| flight_number | Номер рейса | VARCHAR(10) | NOT NULL |
| airplane_id | ID самолёта | NUMBER | FK, NOT NULL |
| airport_id | ID аэропорта | NUMBER | FK, NOT NULL |
| airport_id | ID аэропорта | NUMBER | FK, NOT NULL |
| departure_time | Дата отбытия | DATETIME |  |
| arival_time | Дата прибытия | DATETIME |  |
| gate_id_departure | Дата отбытия | VARCHAR(3) | FK, NOT NULL |
| gate_id_arival | Дата прибытия | VARCHAR(3) | FK, NOT NULL |

## Аэропорт (Airport)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| name | Название аэропорта | VARCHAR(100) | NOT NULL |
| country | Страна | VARCHAR(30) | NOT NULL |
| city | Город | VARCHAR(30) | NOT NULL |

## Шлюз (Gate)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| airport_id | ID аэропорта | NUMBER | FK, NOT NULL |
| number_of_gate | Номер шлюза | VARCHAR(3) | NOT NULL |

## Самолёт (Airplane)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| type_of_board | Тип самолёта | VARCHAR(30) | NOT NULL |

## Места (Seats)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| airplane_id | ID самолёта | NUMBER | FK, NOT NULL |
| seat_number | Номер места | NUMBER | NOT NULL |
| seat_class | Класс места | VARCHAR(10) | NOT NULL |

## Персонал (Personell)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| personal_id | Первичный ключ | NUMBER | PK |
| name | Имя | VARCHAR(30) | NOT NULL |
| fullname | Фамилия | VARCHAR(30) | NOT NULL |
| citizenship | Гражданство | VARCHAR(30) | NOT NULL |
| sex | Пол | BOOL | TRUE/FALSE |
| birthdate | Дата рождения | DATETIME |  |

## Экипаж (Crew)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | NUMBER | PK |
| role | Роль | VARCHAR(10) | NOT NULL |
