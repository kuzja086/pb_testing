﻿#ВариантСогласования=Отказался от ремонта
#ВидРемонта=Платный
#Думает=Думает
#Номенклатура=Техника для ремонта
#НомерТелефона=79826559102
#Отказ=Истина

#language: ru
@tree
#report.feature=Ремонты
#report.story=Ремонты
Функциональность: Платный ремонт думает с отказом покупателя

@КодНастройкиПроцесса=000000006
@ПолныйКодПроцесса=04.05
Сценарий: Платный ремонт думает с отказом покупателя

@КодСценария=000000006
* Сценарий: Создание поступления техники для ремонта
	И я подключаю TestClient "Менеджеры" логин "Менеджеры" пароль ""
	И я закрыл все окна клиентского приложения
	Дано текст субтитров "К нам обратился клиент за платным ремонтом"
	*Вводим его номер телефона и нажимаем кнопку создать платный ремонт
		Когда в поле 'Номер телефона' я ввожу текст "79826559102"
		И я перехожу к следующему реквизиту
		И я запоминаю значение поля с именем "ЛидКонтрагент" как "$Создание поступления техники для ремонта.Покупатель$"
		И я запоминаю строку "Платный" в переменную "ВидРемонта"
		И я нажимаю на кнопку 'Создать платный ремонт'
	*Открывается форма создания нового приема в ремонт
		Тогда открылось окно 'Прием и передача в ремонт (создание)'
		Тогда элемент формы с именем "Контрагент" стал равен "$Создание поступления техники для ремонта.Покупатель$"
		Тогда элемент формы с именем "тлВидРемонта" стал равен "Платный"
		Тогда элемент формы с именем "Номенклатура" стал равен "Техника для ремонта"
	*Нажимаем кнопку сформировать штрихкод, Заполняем поля марка и модель. Если необходимо указываем комплектацию, повреждения и содержание работ.
		И я нажимаю на кнопку 'Сформировать штрихкод'
		И я запоминаю значение поля с именем "СерийныйНомер" как "$Создание поступления техники для ремонта.СерийныйНомер$"
		И я перехожу к следующему реквизиту
		И я нажимаю кнопку выбора у поля "Марка"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я перехожу к строке:
		| ''                        |
		| 'Дополнительное значение' |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно 'Выберите значение свойства Марка'
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Прием и передача в ремонт * от * (не проведен) *'
		И я нажимаю кнопку выбора у поля "Модель"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно 'Прием и передача в ремонт * от * (не проведен) *'
		И в поле 'Модель' я ввожу текст '123'
		И я перехожу к следующему реквизиту
		И в поле 'Комплектация' я ввожу текст 'Комплектация'
		И я перехожу к следующему реквизиту
		И в поле 'Мех. повреждения' я ввожу текст 'Повреждения'
		И в поле 'Содержание' я ввожу текст 'Не работает что-то'
		И в поле с именем "тлИсточник" я ввожу текст "Яндекс"
	*Затем нажимаем кнопку печать и печатаем этикетку, чтобы прикрепить её на технику
		И я нажимаю на кнопку 'Печать этикеток'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно 'Печать этикеток и ценников'
		И я нажимаю на кнопку 'Печать'
		Тогда открылось окно 'Печать документа'
		И я жду когда в табличном документе "ТекущаяПечатнаяФорма" заполнится ячейка "R1C1" в течение 3 секунд
		И Я закрываю окно 'Печать документа'
		Тогда открылось окно 'Печать этикеток и ценников'
		И Я закрываю окно 'Печать этикеток и ценников'
	*Если у клиента необходимо забрать технику, указываем дату забора. Печатаем акт приема передачи. И когда техника у нас на складе, устанавливаем галочку принята в ремонт
		Тогда открылось окно 'Прием и передача в ремонт * от * (не проведен)'
		И в поле "Дата забора" я ввожу текущую дату
		И я запоминаю значение поля с именем "тлМарка" как "Марка"
		И я запоминаю значение поля с именем "тлМодель" как "Модель"
		И я запоминаю значение поля с именем "Контрагент" как "Покупатель"
		И я нажимаю на кнопку 'Акт приемки/передачи'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку 'Записать и продолжить'
		Тогда открылось окно 'Прием и передача в ремонт * от * (не проведен)'
		Дано Табличный документ "ТекущаяПечатнаяФорма" равен макету "Акт" по шаблону
		И Я закрываю окно 'Прием и передача в ремонт * от * (не проведен)'
		Тогда открылось окно 'Прием и передача в ремонт * от * (не проведен)'
		И я перехожу к закладке "Выполнение ремонта"
		И я изменяю флаг ' Принята в ремонт'
	*Техника переходит в статус ожидает диагностики
		Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
		Тогда элемент формы с именем "СуммаДокумента" стал равен "500,00"
		//Доделать
		//И таблица "тлРаботы" стала равной по шаблону:
		  //      | Работа        | Количество | Цена   | Сумма  |
		    //    | "Диагностика" | 1,000      | 500,00 | 500,00 |
		И я нажимаю на кнопку 'Получить навигационную ссылку'
		И я запоминаю значение поля с именем "тлНавигационнаяСсылка" как "$Создание поступления техники для ремонта.СсылкаНАПрием$"
		И я очищаю окно сообщений пользователю
		И Я закрываю окно 'Прием и передача в ремонт * от *'


@КодСценария=000000013
* Сценарий: Считывание штрихкодов техники (Изменение статуса)
	И я подключаю TestClient "Мастер" логин "Мастер" пароль ""
	И я закрыл все окна клиентского приложения
	И в поле с именем "Штрихкод" я ввожу текст "$Создание поступления техники для ремонта.СерийныйНомер$"
	Когда я нажимаю на кнопку 'Обработать штрихкод'
	Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
	И я очищаю окно сообщений пользователю


@КодСценария=000000015
* Сценарий: Заполнение работ по ремонтам
	И я подключаю TestClient "Мастер" логин "Мастер" пароль ""
	И я закрыл все окна клиентского приложения
	И в поле с именем "Штрихкод" я ввожу текст "$Создание поступления техники для ремонта.СерийныйНомер$"
	Когда я нажимаю на кнопку 'Обработать штрихкод'
	И в таблице "тлРаботы" я нажимаю на кнопку с именем 'тлРаботыДобавить'
	//И в таблице "тлРаботы" я нажимаю кнопку выбора у реквизита "Работа"
	//Тогда открылось окно 'Выбор типа данных'
	//И я нажимаю на кнопку 'ОК'
	//Тогда открылось окно 'Прием и передача в ремонт * от * *'
	И в таблице "тлРаботы" в поле 'Работа' я ввожу текст 'Замена барабана'
	И в таблице "тлРаботы" я активизирую поле "Количество"
	И в таблице "тлРаботы" в поле 'Количество' я ввожу текст '1,000'
	И в таблице "тлРаботы" я завершаю редактирование строки
	И в таблице "тлРаботы" я нажимаю на кнопку с именем 'тлРаботыДобавить'
	И в таблице "тлРаботы" в поле 'Работа' я ввожу текст 'Замена шланга'
	И в таблице "тлРаботы" я активизирую поле "Количество"
	И в таблице "тлРаботы" в поле 'Количество' я ввожу текст '2,000'
	И в таблице "тлРаботы" я завершаю редактирование строки
	И я нажимаю на кнопку 'Зафиксировавть работы'
	Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
	И я очищаю окно сообщений пользователю
	И я закрываю сеанс TESTCLIENT


@КодСценария=000000016
* Сценарий: Согласование с клиентом
	И я подключаю TestClient "Менеджеры" логин "Менеджеры" пароль ""
	И я закрыл все окна клиентского приложения
	*Открывается документ приема, переходим на вкладку Выполнение ремонта и устанавливаем цены на работы
		Дано Я открываю навигационную ссылку "$Создание поступления техники для ремонта.СсылкаНАПрием$"
		Тогда открылось окно 'Прием и передача в ремонт * от *'
		И я перехожу к закладке "Выполнение ремонта"
		И в таблице "тлРаботы" я перехожу к строке:
		| 'Работа'        |
		| 'Замена шланга' |
		И в таблице "тлРаботы" я активизирую поле "Цена"
		И в таблице "тлРаботы" я выбираю текущую строку
		И в таблице "тлРаботы" в поле 'Цена' я ввожу текст '1 000,00'
		И в таблице "тлРаботы" я завершаю редактирование строки
		И в таблице "тлРаботы" я перехожу к строке:
		| 'Работа'          |
		| 'Замена барабана' |
		И в таблице "тлРаботы" я активизирую поле "Цена"
		И в таблице "тлРаботы" я выбираю текущую строку
		И в таблице "тлРаботы" в поле 'Цена' я ввожу текст '1 000,00'
		И в таблице "тлРаботы" я завершаю редактирование строки
	*Менеджер связывается с клиентом и согласует работы. От необязательных работ клиент может отказаться. Для этого необходимо снять флажок Согласен на ремонт
		И в таблице "тлРаботы" я снимаю флаг 'Согласие на работу'
		И в таблице "тлРаботы" я завершаю редактирование строки
		И я нажимаю на кнопку 'Провести'
		И в поле "Дата доставки" я ввожу текущую дату
		//Для Видео убрал
		И я запоминаю строку "Думает" в переменную "Думает"
		Если переменная "Думает" имеет значение "Думает" Тогда
				И из выпадающего списка "тлВариантСогласованияРемонта" я выбираю точное значение "Думает"
				И я устанавливаю флаг 'тлСогласованиеРемонта'
				Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
				И я очищаю окно сообщений пользователю

	*Если клиент согласен на работы, указываем, что клиент согласен на ремонт и устанавливаем флажок, техника переходит в следующий статус.
		И из выпадающего списка "тлВариантСогласованияРемонта" я выбираю точное значение "Отказался от ремонта"
		И я устанавливаю флаг 'тлСогласованиеРемонта'
		Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
		И Я закрываю окно 'Прием и передача в ремонт * от *'
		И я очищаю окно сообщений пользователю


@КодСценария=000000021
* Сценарий: Возврат техники
	И я подключаю TestClient "Менеджеры" логин "Менеджеры" пароль ""
	И я закрыл все окна клиентского приложения
	*Открываем документ приема в ремонт, заполняем срок гарантии, указываем что техника выдана покупателю. Также необходимо распечатать акт приема передачи и гаратнтийный талон и подписать с клиентом.
		Дано Я открываю навигационную ссылку "$Создание поступления техники для ремонта.СсылкаНАПрием$"
		Тогда открылось окно 'Прием и передача в ремонт * от *'
		И Пауза 1
		И я перехожу к закладке "Выполнение ремонта"
		И я запоминаю строку "Ложь" в переменную "Отказ"
		Если переменная "Отказ" имеет значение "Истина" Тогда
				И из выпадающего списка с именем "тлГарантия" я выбираю точное значение '1 месяц'

		И Пауза 1
		И я изменяю флаг 'ВыдачаИзРемонта'
		Затем я жду, что в сообщениях пользователю будет подстрока "установлен статус" в течение 3 секунд
		И я нажимаю на кнопку 'Акт приемки/передачи'
		Тогда открылось окно 'Печать документа'
		И в табличном документе 'ТекущаяПечатнаяФорма' я перехожу к ячейке "R1C1:R1C11"
		И Пауза 3
		И Я закрываю окно 'Печать документа'
		Тогда открылось окно 'Прием и передача в ремонт * от *'
		И я нажимаю на кнопку 'Гарантийный талон'
		Тогда открылось окно 'Печать документа'
		И в табличном документе 'ТекущаяПечатнаяФорма' я перехожу к ячейке "R1C1:R1C10"
		И Пауза 3
		И Я закрываю окно 'Печать документа'
		//И Я закрываю окно 'Прием и передача в ремонт * от *'
		//И я закрываю сеанс TESTCLIENT
