# Tamagotchi

**App version:** 1.0

# Content

- [I. General information about project](#i-general-information-about-project)
  * [Project description](#project-description)
  * [Quick references](#quick-references)
  * [Documentation](#quick-references)
  * [Team](#quick-references)
- [II. Development](#ii-development)
  * [Рабочая среда](#рабочая-среда)
  * [Extensions for VScode](#расширения-для-vscode)
  * [Общие требования к коду](#общие-требования-к-коду)
  * [Структура папок](#общие-требования-к-коду)
  * [Dependency Injection](#dependency-injection)
  * [Архитектура экранов](#общие-требования-к-коду)

# I. General information about project

## Progect description

В данном репозитории осуществляется разработка мобильного приложения Career Day.

## Быстрые ссылки

- [Техническое задание](https://docs.google.com/document/d/1kZFMwY73FMGItWTOMbnf_g20YxHOcurEMj8vUvdSTp0/edit).
- [Макеты в figma](https://www.figma.com/file/810qudOGDUiOR0eeS8sdMf/Sunmait-Career-Day?node-id=0%3A1)
- [Доска проекта](https://trello.com/b/mMTGtLow/flutter-career-day)

## Документация

- [Документация по API](https://sunmait-career-day-be.herokuapp.com/api/v1/api-docs/)
- [Требования по Flutter для разработчиков](https://dart.dev/guides/language/effective-dart/style)

## Команда

- Никита Курочкин - Flutter-разработчик

# II. Разработка

## Рабочая среда

Рекомендованный редактор кода: `Visual Studio Code`.

## Расширения для VScode

Рекомендованные расширения:

- [Folder Templates (в проекте настроены шаблоны для генерации)](https://marketplace.visualstudio.com/items?itemName=Huuums.vscode-fast-folder-structure)
- [Dart Barrel File Generator](https://marketplace.visualstudio.com/items?itemName=miquelddg.dart-barrel-file-generator)

## Общие требования к коду

Все требования к оформлению кода описаны в [официальной документации](https://dart.dev/guides/language/effective-dart/style) для языка Dart.

## Структура папок

    careerdaymobile
    ├── README.md               # Информация о проекте.
    │
    ├── .vscode                 
    │   └── settings.json       # Файл конфигурации для расширения Folder Templates.
    │
    ├── assets                  # Исходные файлы png, svg, fonts, локализация.
    │
    └── lib                    
        ├── main.dart           # Функция входа в приложение.
        │
        ├── stores              # Глобальные store для работы приложения (например `UserDataStore`).
        ├── services            # Сервисы для работы приложения (например сервис `ApiService`).
        ├── models              # Модели данных.
        ├── directories         # Репозитории данных (например конфигурация приложения, цвета приложения).
        ├── custom              # Кастомные расширения (например парсеры, классы архитектуры экранов).
        ├── components          # Виджеты и компоненты, используемые в приложениии.
        └── screens             # Экраны приложения и их логика.

## Dependency Injection

В качестве DI на проекте используется GetIt.

В main.dart реализовано конфигурирование DI.

## Архитектура экранов

В качестве архитектуры экранов приложения выбран шаблон View-Presenter-Datasource.

В общем, он является вариацией шаблона MVC (Model-View-Controller) и состоит из 3х блоков:

- `VPDScreenState` - StatefulWidget. Отвечает за отрисовку копмонентов. Содержит ссылку на Presenter.
- `VPDPresenter` - Presenter. Отвечает за обработку событий экрана (например нажатия, обработка состояний экрана)
- `Store` - Datasource. Является mobX `Store`'ом, отвечает за хранение и обработку данных экрана.

### Представление экранов по файлам

- `{name}_screen.dart` - `VPDScreenState`.
- `{name}_presenter.dart` - `VPDPresenter`.
- `{name}_datasource.dart` - `Store`.

> Для быстрого создания экрана со всеми необходимыми файлами создан шаблон для библиотеки Folder Templates.
