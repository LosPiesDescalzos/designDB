# Используем базовый образ
FROM postgres:latest

# Установка переменных окружения
ENV POSTGRES_USER=kate
ENV POSTGRES_PASSWORD=1234
ENV POSTGRES_DB=database

# Копирование исходного SQL-скрипта в контейнер
#COPY init.sql /docker-entrypoint-initdb.d/
#COPY ./src/HW1/driverLicense.csv /csvfiles/

# Открытие порта для доступа к базе данных
EXPOSE 5432

