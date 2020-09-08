﻿#language: ru
@tree
#report.feature=
#report.story=
Функциональность: Работа с гарантиями

@КодНастройкиПроцесса=000000008
@ПолныйКодПроцесса=07
Сценарий: Работа с гарантиями

@КодСценария=000000040
* Сценарий: Расширенная гарантия
	И я подключаю TestClient "Менеджеры" логин "Менеджеры" пароль ""
	И я закрыл все окна клиентского приложения
	Если "Истина"'=Истина' Тогда
			*И Открытие смены [КассаККМ]
				И В командном интерфейсе я выбираю 'Тест подсистема' 'Тест работа с кассовыми сменами'
				Тогда открылось окно 'Тест работа с кассовыми сменами'
				И в поле 'Касса ККМ' я ввожу текст "Касса ККМ (Блюхера)"
				И из выпадающего списка "Касса ККМ" я выбираю по строке "Касса ККМ (Блюхера)"
				И я нажимаю на кнопку 'Открыть смену'

	И В командном интерфейсе я выбираю 'Продажи' 'Чеки ККМ'
	Тогда открылось окно 'Чеки ККМ'
	И я нажимаю кнопку выбора у поля "КассаККМОтбор"
	Тогда открылось окно 'Кассы ККМ'
	И в таблице "Список" я перехожу к строке:
	| 'Наименование' |
	| "Касса ККМ (Блюхера)"     |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "ЧекиККМ" я нажимаю на кнопку с именем 'ЧекиККМСоздатьЧек'
	Тогда открылось окно 'Чек ККМ (создание)'
	И в поле 'Покупатель' я ввожу текст "Тестовый покупатель"
	И из выпадающего списка "Покупатель" я выбираю по строке "Тестовый покупатель"
	И в поле "Дата доставки" я ввожу текущую дату
	И я перехожу к следующему реквизиту
	И для каждого значения "ЗначениеИзМассива" из массива "2000000000084\;2000000000091"
			И я нажимаю на кнопку с именем 'ЗапасыПоискПоШтрихкоду'
			Тогда открылось окно 'Введите штрихкод'
			И в поле с именем "Штрихкод" я ввожу значение переменной "ЗначениеИзМассива"
			И я нажимаю на кнопку с именем "ФормаОК"
			Тогда открылось окно 'Чек ККМ (создание) *'
			И в таблице "Запасы" я активизирую поле "Гарантия"
			И в таблице "Запасы" я выбираю текущую строку
			И в таблице "Запасы" из выпадающего списка "Гарантия" я выбираю точное значение 'Расширенная гарантия 6 м.'
			И в таблице "Запасы" я завершаю редактирование строки

	И таблица "Запасы" равна макету "ТаблицаЗапасыРасширеннаяГарантия"
	И я нажимаю на кнопку '<'
	И я нажимаю на кнопку 'Пробить чек'
	Тогда открылось окно 'Печать документа'
	Дано Табличный документ "ТекущаяПечатнаяФорма" равен макету "тлРасширенныйГарантийныйТалон"
	И Я закрываю окно 'Печать документа'
	Тогда открылось окно 'Чек ККМ * от *'
	И Я закрываю окно 'Чек ККМ * от *'
	Если "Ложь""=Истина" Тогда
			*И Закрытие смены [КассаККМ]
				И В командном интерфейсе я выбираю 'Тест подсистема' 'Тест работа с кассовыми сменами'
				Тогда открылось окно 'Тест работа с кассовыми сменами'
				И в поле 'Касса ККМ' я ввожу текст 'Касса ККМ (Блюхера)'
				И из выпадающего списка "Касса ККМ" я выбираю по строке "Касса ККМ (Блюхера)"
				И я нажимаю на кнопку 'Закрыть смену'



@КодСценария=000000042
* Сценарий: Печать Гарантийного талона из Приема в ремонт
	И я подключаю TestClient "Менеджеры" логин "Менеджеры" пароль ""
	И я закрыл все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/data/Документ.ПриемИПередачаВРемонт?ref=861b001e67069f8b11ea83a77bb3899a"
	Тогда открылось окно 'Прием и передача в ремонт * от *'
	И я нажимаю на кнопку 'Гарантийный талон'
	Тогда открылось окно 'Печать документа'
	Дано Табличный документ "ТекущаяПечатнаяФорма" равен макету "тлГарантийныйТалонДвеСтроки" по шаблону
	И Я закрываю окно 'Печать документа'
	Тогда открылось окно 'Прием и передача в ремонт * от *'
	И Я закрываю окно 'Прием и передача в ремонт * от *'
