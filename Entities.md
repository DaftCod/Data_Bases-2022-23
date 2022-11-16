# Описание сущностей

## User_roles (Роли пользователей)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | VARCHAR(14) | PK |
| role | Роль | VARCHAR(10) | NOT NULL |

## User (Пользователь)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| password | Пароль пользователя | VARCHAR(255) | NOT NULL, SHA-256 |
| name | Имя | VARCHAR(30) | NOT NULL |
| role_id | Роль пользователя | INT | FK, NOT NULL |
| fullname | Фамилия | VARCHAR(30) | NOT NULL |
| citizenship | Гражданство | VARCHAR(30) | NOT NULL |
| sex | Пол | VARCHAR(6) | NOT NULL |
| birthdate | Дата рождения | DATETIME |  |
| passport_series_and_INT | Пасспортные данные | VARCHAR(9) | NOT NULL |
| passport_id | ID пасспорта | VARCHAR(14) | NOT NULL |

## Билет (Ticket)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| INT_of_ticket | Первичный ключ | INT | PK |
| price | Цена | DOUBLE | NOT NULL |
| id_passenger | ID пассажира | VARCHAR(14) | FK, NOT NULL |
| id_flight | ID рейса | INT | FK, NOT NULL |

## Рейс (Flight)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| flight_INT | Номер рейса | VARCHAR(10) | NOT NULL |
| airplane_id | ID самолёта | INT | FK, NOT NULL |
| airport_id | ID аэропорта | INT | FK, NOT NULL |
| airport_id | ID аэропорта | INT | FK, NOT NULL |
| departure_time | Дата отбытия | DATETIME |  |
| arival_time | Дата прибытия | DATETIME |  |
| gate_id_departure | Дата отбытия | VARCHAR(3) | FK, NOT NULL |
| gate_id_arival | Дата прибытия | VARCHAR(3) | FK, NOT NULL |

## Аэропорт (Airport)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| name | Название аэропорта | VARCHAR(100) | NOT NULL |
| country | Страна | VARCHAR(30) | NOT NULL |
| city | Город | VARCHAR(30) | NOT NULL |

## Шлюз (Gate)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| airport_id | ID аэропорта | INT | FK, NOT NULL |
| INT_of_gate | Номер шлюза | VARCHAR(3) | NOT NULL |

## Самолёт (Airplane)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| type_of_board | Тип самолёта | VARCHAR(30) | NOT NULL |

## Места (Seats)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| airplane_id | ID самолёта | INT | FK, NOT NULL |
| seat_INT | Номер места | INT | NOT NULL |
| seat_class | Класс места | VARCHAR(10) | NOT NULL |

## Персонал (Personell)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| personal_id | Первичный ключ | INT | PK |
| name | Имя | VARCHAR(30) | NOT NULL |
| fullname | Фамилия | VARCHAR(30) | NOT NULL |
| citizenship | Гражданство | VARCHAR(30) | NOT NULL |
| sex | Пол | VARCHAR(6) | NOT NULL |
| birthdate | Дата рождения | DATETIME |  |
| role_id | ID роли персонала | INT | FK, NOT NULL |
| crew_id | ID экипажа | INT | FK, NOT NULL |

## Personell_roles (Роли персонала)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | VARCHAR(14) | PK |
| role | Роль | VARCHAR(10) | NOT NULL |

## Экипаж (Crew)
| Имя поля | Описание | Тип | Ограничения |
|:--------:|:--------:|:---:|:-----------:|
| id | Первичный ключ | INT | PK |
| airplane_id | ID самолёта | INT | FK, NOT NULL |
