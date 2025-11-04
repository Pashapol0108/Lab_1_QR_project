# Проект по регистрации участников на мероприятие

Проект предназначен для регистрации участников, сбора информации о них и отметки на локациях.

---

## Структура проекта

1. **`app.py`** – главный файл программы, где реализована вся логика, маршруты и взаимодействия.  
2. **`templates/`** – папка с HTML-шаблонами.  
3. **`instance/`** – папка с базами данных:  
   - `checkins` – отметки пользователей на локациях,  
   - `participants` – данные участников.  
4. **`static/`** – папка с ресурсами:  
   - `qr/` – QR-коды участников,  
   - файл согласия (пока пустой).  
5. **`README.md`** – инструкция по запуску проекта.  
6. **`participants_export.csv`** – таблица с данными участников.  
7. **`requirements.txt`** – список зависимостей Python.

---

## Веб-сервис

### 1. Страница регистрации
- Форма для ввода данных участников и согласия.  
- Каждое поле интерактивно: проверяет уникальность и корректность ввода.  
- После успешной регистрации участник получает QR-код, который можно скачать или заскринить.  
- Также предоставлена прямая ссылка на страницу участника.

### 2. Страница отметки на локации
- Проверяющий считывает QR-код участника со своего телефона.  
- Переходит по личной ссылке на страницу с PIN-кодом (1234).  
- После ввода PIN проверяющий может отметить участника на своей локации.  

### 3. Обработка невалидных ссылок
- Если ссылка недействительна, пользователь попадает на страницу `404` (`not_found.html`) с предложением вернуться на главную страницу.

### 4. Админ-панель
- Доступна по роуту `/admin` с логином `admin` и паролем `admin`.  
- Отображает таблицу с данными участников.  
- Возможна выгрузка данных в CSV.  
- Также базу данных можно скачать напрямую в формате SQLite.  

---

## Дизайн и доработки
- Интерфейс минималистичный и простой, легко поддается доработке.  
- Базы данных и CSV-файл создаются автоматически, если их нет.  
- Возможна дальнейшая модернизация проекта и доработка функционала.

---

## Развертывание
- Рассматривается возможность упаковки проекта в Docker-контейнер.  
- Альтернативные варианты развертывания на сервере обсуждаемы.






# Инструкция по запуску проекта на Python с Flask и зависимостями.


---

## 1. Установка Python

Проект поддерживает Python 3.9–3.11.  
Скачать можно с [официального сайта Python](https://www.python.org/downloads/).

> pip обычно устанавливается вместе с Python.

---

## 2. Установка зависимостей и запуск проекта

### Windows

1. Перейти в папку проекта:

```cmd
cd C:\Users\p.polyakov\Desktop\qr
```

2. Создать виртуальное окружение:

```cmd
python -m venv .venv
```

3. Активировать виртуальное окружение:

```cmd
.venv\Scripts\activate.bat
```

4. Установить зависимости:

```cmd
python -m pip install -r requirements.txt
```

> При необходимости обновить pip:
>
> ```cmd
> python -m pip install --upgrade pip
> ```

5. Запустить приложение:

```cmd
python app.py
```

Приложение будет доступно по адресу: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

### macOS / Linux

1. Перейти в папку проекта:

```bash
cd ~/Desktop/qr
```

2. Создать виртуальное окружение:

```bash
python3 -m venv venv
```

3. Активировать виртуальное окружение:

```bash
source venv/bin/activate
```

4. Установить зависимости:

```bash
pip install -r requirements.txt
```

> При необходимости обновить pip:
>
> ```bash
> pip install --upgrade pip
> ```

5. Запустить приложение:

```bash
python app.py
```

Приложение будет доступно по адресу: [http://127.0.0.1:8000](http://127.0.0.1:8000)

---

## Lab 2 - Security Practices

This branch demonstrates security practices including:

### Security Tools
- **Gitleaks**: Secret detection in code and history
- **Pre-commit hooks**: Automatic secret scanning before commits
- **SBOM**: Software Bill of Materials generation
- **Dependabot**: Automated dependency updates

### Files Added
- `.gitleaks.toml` - Secret detection configuration
- `.pre-commit-config.yaml` - Pre-commit hooks
- `.gitleaksignore` - False positives ignore list
- `sbom.json` - Software Bill of Materials
- `.github/dependabot.yml` - Automated dependency updates

### Usage
- Pre-commit hook automatically scans for secrets on each commit
- Run `gitleaks detect --source .` to manually scan for secrets
- SBOM generated with `syft packages requirements.txt -o cyclonedx-json > sbom.json`
