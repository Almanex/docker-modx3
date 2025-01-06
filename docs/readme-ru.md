# Docker MODX - Локальная среда разработки

Готовое решение для быстрого развертывания MODX в Docker-контейнерах. Идеально подходит для локальной разработки сайтов и расширений.

## 🚀 Быстрый старт

Перед началом убедитесь, что на вашем компьютере установлены [Docker](https://www.docker.com/get-started/)

Клонирование репозитория в директорию проекта
```bash
git clone "https://github.com/Prihod/docker-modx.git" ./
```
Запуск контейнеров
```bash
docker-compose up -d
```
Просмотр лога установки MODX
```bash
docker-compose logs -f php
```

### Список URL

| URL                      | Описание                                      |
|--------------------------|-----------------------------------------------|
| http://localhost/manager | Админка MODX. Логин: `admin`, Пароль: `admin` |
| http://localhost:8080    | phpMyAdmin. Логин: `modx`, Пароль: `modx`     |
| http://localhost:8025    | MailHog                                       |
| http://localhost:8181    | XHGui (опционально)                           |

## ✨ Основные возможности

- Настраиваемая версия PHP
- Автоматическая установка/обновление MODX
- Экспорт/импорт данных с автокорректировкой путей
- Управление БД через phpMyAdmin
- Тестирование email через [MailHog](https://github.com/mailhog/MailHog)
- Самоподписанный SSL-сертификат
- SSH-доступ
- Поддержка Xdebug
- Профилирование через [Xhprof](https://www.php.net/manual/en/ref.xhprof.php) + [XHGui](https://github.com/perftools/xhgui)
- Интеграция с [Blackfire](https://www.blackfire.io/php)

## 🏗 Архитектура проекта

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Prihod/docker-modx/main/docs/images/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/Prihod/docker-modx/main/docs/images/architecture-light.svg">
  <img alt="Схема архитектуры" src="https://raw.githubusercontent.com/Prihod/docker-modx/main/docs/images/architecture-light.svg">
</picture>

## 🗃️ Структура проекта
<details><summary>Показать структуру</summary>

```
.
|-- .env
|-- .gitignore
|-- README.md
|-- docker
|   |-- logs
|   |   |-- nginx
|   |   `-- php
|   |-- mariadb
|   |   `-- conf
|   |       `-- custom.cnf
|   |-- modx
|   |   |-- storage
|   |   |   |-- backup
|   |   |   `-- cache
|   |   `-- tools
|   |       `-- configurator
|   |           |-- composer.json
|   |           |-- config.inc.php
|   |           |-- example.config.inc.php
|   |           |-- run.php
|   |           |-- src
|   |           |   |-- Runner
|   |           |   |   |-- Runner.php
|   |           |   |   `-- RunnerInterface.php
|   |           |   |-- Tasks
|   |           |   |   |-- GrantAccessUserTask.php
|   |           |   |   |-- InstallPackagesTask.php
|   |           |   |   |-- MiniShop2Task.php
|   |           |   |   |-- SetOptionsTask.php
|   |           |   |   |-- Task.php
|   |           |   |   |-- TaskInterface.php
|   |           |   |   `-- TransportProvidersTask.php
|   |           |   |-- Traits
|   |           |   |   |-- DocumentTrait.php
|   |           |   |   |-- ElementsTrait.php
|   |           |   |   |-- InitializeTrait.php
|   |           |   |   |-- OptionTrait.php
|   |           |   |   |-- PropertiesTrait.php
|   |           |   |   |-- SecurityTrait.php
|   |           |   |   `-- TransportProviderTrait.php
|   |           |   `-- Utils
|   |           |       `-- Logger.php
|   |           `-- storage
|   |               `-- ms2
|   |                   |-- demo
|   |                   |   |-- categories.csv
|   |                   |   |-- products
|   |                   |   |-- products.csv
|   |                   |   |-- vendors
|   |                   |   `-- vendors.csv
|   |                   |-- pages
|   |                   |   |-- cart.tpl
|   |                   |   `-- category.tpl
|   |                   `-- templates
|   |                       |-- cart.tpl
|   |                       |-- category.tpl
|   |                       `-- product.tpl
|   |-- nginx
|   |   |-- default.conf.template
|   |   `-- ssl
|   |-- php
|   |   |-- Dockerfile
|   |   |-- conf
|   |   |   |-- opcache.ini
|   |   |   |-- php.ini
|   |   |   |-- xdebug.ini
|   |   |   `-- xhprof.ini
|   |   |-- sh
|   |   |   |-- modx-clear-db.sh
|   |   |   |-- modx-clear-site.sh
|   |   |   |-- modx-configure.sh
|   |   |   |-- modx-docker-start.sh
|   |   |   |-- modx-download.sh
|   |   |   |-- modx-export.sh
|   |   |   |-- modx-generate-ssl.sh
|   |   |   |-- modx-import.sh
|   |   |   |-- modx-install.sh
|   |   |   |-- modx-uninstall.sh
|   |   |   `-- modx-upgrade.sh
|   |   `-- xhprof
|   |       |-- composer.json
|   |       `-- handler.php
|   |-- volume
|   |   `-- mariadb
|   `-- xhgui
|       |-- Dockerfile
|       |-- apache.conf
|       |-- config.php
|       `-- mongo.init.d
|           `-- xhgui.js
|-- docker-compose.override.blackfire.yml
|-- docker-compose.override.xhprof.yml
|-- docker-compose.yml
`-- www
```
</details>


## 📦 PHP-расширения

- GD, PDO, MySQLi
- ImageMagick, PCNTL
- Redis, OPcache, Fileinfo
- Xdebug (опционально)
- Xhprof (опционально)
- Blackfire (опционально)

## 🎬 Видео - Практическое руководство
[![Практическое руководство](images/video-cover.jpg)](https://rutube.ru/video/e9d3f4c4134ac17c693738c4ea45094b/)

## 🖥️ Используйте команды Docker

### Переустановка MODX
```bash
MODX_RESET=1 docker-compose up -d
```

### Экспорт данных
```bash
docker-compose exec php modx-export.sh
```
Данные сохраняются в `./docker/modx/storage/backup`

### Импорт данных

Импорт из последнего архива
```bash
MODX_IMPORT=latest docker-compose up -d
```
Импорт из конкретного архива
```bash
MODX_IMPORT=<имя_архива> docker-compose up -d
```
Архив для импорта должен находиться в директории `./docker/modx/storage/backup` с файловой структурой экспорта.

### SSH-доступ
```bash
ssh dev@127.0.0.1 -p 2222  # Логин: dev, Пароль: dev
```

## ⚙️ Конфигурация

Все настройки проекта находятся в файле `.env`. Ниже приведены основные параметры:

| Название                     | Значение по умолчанию     | Описание                                                                                                                 |
|------------------------------|---------------------------|--------------------------------------------------------------------------------------------------------------------------|
| PHP_VERSION                  | 7.4                       | Версия PHP-FPM                                                                                                           |
| MODX_VERSION                 | 2.8.8-pl                  | Версия MODX                                                                                                              |
| MODX_INSTALL_ENABLE          | 1                         | Автоматически устанавливать MODX                                                                                         |
| MODX_USE_CACHE_SOURCE        | 1                         | Сохранять setup архив MODX                                                                                               |
| MODX_CONFIGURE_ENABLE        | 0                         | По окончанию установки MODX запускать скрипт его конфигурации                                                            |
| MODX_CONFIGURE_DEV_MODE      | 0                         | Dev режиме работы скрипта конфигурации MODX                                                                              |
| MODX_TABLE_PREFIX            | random:8                  | Префикс таблиц базы данных. При значении `random:число` будет сгенерирована случайная строка с указанным числом символов |
| MODX_HTTP_HOST               | localhost                 | Имя хоста сайта                                                                                                          |
| MODX_LANGUAGE                | en                        | Язык, на котором будет установлен MODX                                                                                   |
| MODX_CMS_ADMIN               | admin                     | Логин администратора MODX                                                                                                |
| MODX_CMS_PASS                | admin                     | Пароль администратора MODX                                                                                               |
| MODX_IMPORT_DB               | 1                         | Импортировать базу данных MODX                                                                                           |
| MODX_IMPORT_SITE             | 1                         | Импортировать файлы MODX                                                                                                 |
| MODX_EXPORT_DB               | 1                         | Экспортировать базу данных MODX                                                                                          |
| MODX_EXPORT_SITE             | 1                         | Экспортировать файлы MODX                                                                                                |
| MODX_EXPORT_OVERWRITE_CONFIG | 0                         | При экспорте перезаписывать данные в конфигурационных файлах MODX на значения из `MODX_EXPORT_...` переменных            | |
| XDEBUG_ENABLE                | 0                         | Установить для PHP-FPM расширение Xdebug                                                                                 |
| XHPROF_ENABLE                | 0                         | Установить для PHP-FPM расширение Xhprof                                                                                 |
| SSH_ENABLE                   | 1                         | Разрешить SSH для контейнера `php`                                                                                       |
| SSL_GENERATE                 | 1                         | Генерировать самоподписанный SSL сертификат                                                                              |
| NGINX_PORT                   | 80                        | Порт для NGINX                                                                                                           |
| MARIADB_PORT                 | 3306                      | Порт для MariaDB                                                                                                         |
| PHPMYADMIN_PORT              | 8080                      | Порт для phpMyAdmin                                                                                                      |
| MAILHOG_PORT                 | 8025                      | Порт для  MailHog                                                                                                        |
| SMTP_PORT                    | 1025                      | SMTP порт                                                                                                                |
| SMTP_HOST                    | mailhog                   | SMTP хост                                                                                                                |

## 🔧 Расширенные возможности

### Автоконфигурация MODX

При `MODX_CONFIGURE_ENABLE = 1` после установки запускается скрипт конфигурации из `./docker/modx/tools/configurator/run.php`.

Скрипт выполняет задачи, указанные в конфигурационном файле `config.inc.php` в опции `tasks`.

При `MODX_CONFIGURE_DEV_MODE = 1`, после выполнения всех задач не будет происходить очистка кэша и логов MODX, а также удаление директории `./www/core/configurator`, что позволяет вручную запускать скрипт конфигурации во время разработки.

```sh
docker-compose exec php bash && php /var/www/html/core/configurator/run.php
```

#### Доступные задачи конфигурации

| Название               | Ключ с опциями в config.inc.php | Описание                                                     |
|------------------------|---------------------------------|--------------------------------------------------------------|
| TransportProvidersTask | transport_providers             | Добавление транспортных провайдеров                          |
| InstallPackagesTask    | install_packages                | Установка пакетов                                            |
| SetOptionsTask         | set_options                     | Настройка системных параметров                               |
| GrantAccessUserTask    | grant_access_user               | Настройка прав доступа                                       |
| MiniShop2Task          | ms2                             | Настройка магазина на miniShop2 (опционально с демо-данными) |

### Создание собственных задач

1. Создайте класс в `./docker/modx/tools/configurator/src/Tasks`
2. Унаследуйте его от класса `Task`
3. Реализуйте методы `getName` и `execute`
4. Добавьте задачу в `config.inc.php`

### Пример

Вывод в лог MODX всех опции из файла `config.inc.php`:

```php
<?php

namespace App\Tasks;

use App\Utils\Logger;

class DemoLogTask extends Task
{
    public function getName(): string
    {
        return 'Demo log';
    }

    public function execute(): void
    {
        Logger::info("Start execute my task!");
        $this->modx->log(\modX::LOG_LEVEL_ERROR, print_r($this->getProperties(), 1));
        Logger::info("Finish execute my task!");
    }
}
```

## 🛠 Инструменты разработчика

### Xdebug
```env
XDEBUG_ENABLE=1
```

### Xhprof + XHGui
```env
XHPROF_ENABLE=1
# + переименуйте docker-compose.override.xhprof.yml в docker-compose.override.yml
```

### Blackfire
```env
BLACKFIRE_ENABLE=1
BLACKFIRE_CLIENT_ID=<client_id>
BLACKFIRE_CLIENT_TOKEN=<client_token>
BLACKFIRE_SERVER_ID=<server_id>
BLACKFIRE_SERVER_TOKEN=<server_token>
# + переименуйте docker-compose.override.blackfire.yml в docker-compose.override.yml
```

### ⚠️ Примечание

При изменении конфигурации пересоберите контейнер:
```bash
docker-compose build --no-cache php
```
## Основные команды Docker и Docker Compose
| **Команда**                                             | **Описание**                                                                                      |
|---------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| **Docker**                                              |                                                                                                   |
| `docker ps`                                             | Показывает запущенные контейнеры.                                                                 |
| `docker restart <container_id>`                         | Перезапускает контейнер.                                                                          |
| `docker logs <container_id>`                            | Показывает логи контейнера.                                                                       |
| `docker exec -it <container_id> bash`                   | Открывает терминал внутри контейнера.                                                             |
| `docker system prune`                                   | Удаляет неиспользуемые данные (контейнеры, образы, тома, сети).                                   |
| **Docker Compose**                                      |                                                                                                   |
| `docker-compose up`                                     | Запускает все сервисы, указанные в `docker-compose.yml`.                                          |
| `docker-compose up -d`                                  | Запускает сервисы в фоновом режиме.                                                               |
| `docker-compose down`                                   | Останавливает и удаляет сервисы, сети, тома, созданные `up`.                                      |
| `docker-compose restart`                                | Перезапускает все сервисы.                                                                        |
| `docker-compose ps`                                     | Показывает список работающих сервисов.                                                            |
| `docker-compose logs`                                   | Показывает логи всех сервисов.                                                                    |
| `docker-compose logs --tail <number>`                   | Показывает последние `<number>` строк логов всех сервисов.                                        |
| `docker-compose logs -f <service_name>`                 | Показывает и продолжает поток логов для указанного сервиса.                                       |
| `docker-compose logs -f --tail <number> <service_name>` | Показывает и продолжает поток логов для указанного сервиса, начиная с последних `<number>` строк. |
| `docker-compose exec <service_name> bash`               | Открывает терминал внутри указанного сервиса.                                                     |
| `docker-compose build`                                  | Собирает образы для сервисов из `docker-compose.yml`.                                             |
| `docker-compose build --no-cache`                       | Собирает образы без использования кэша.                                                           |
| `docker-compose build --no-cache <service_name>`        | Собирает образ для указанного сервиса без использования кэша.                                     |
| `docker-compose top`                                    | Показывает процессы, запущенные сервисами.                                                        |