require 'telegram/bot'

TOKEN = '663967371:AAFbkckpahFSA6s2mMWfCrc5zR45JcG7ANk'

ANSWERS = [
  # Положительные
  "Бесспорно",
  "Предрешено",
  "Никаких сомнений",
  "Определённо да",
  "Можешь быть уверен в этом",

  # Нерешительно положительные
  "Мне кажется — «да»",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят — «да»",
  "Да",

  # Нейтральные
  "Пока не ясно, попробуй снова",
  "Спроси позже",
  "Лучше не рассказывать",
  "Сейчас нельзя предсказать",
  "Сконцентрируйся и спроси опять",

  # Отрицательные
  "Даже не думай",
  "Мой ответ — «нет»",
  "По моим данным — «нет»",
  "Перспективы не очень хорошие",
  "Весьма сомнительно"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		case message.text
		when '/start'
			bot.api.send_message(chat_id: message.chat.id, text: "Здравствуй, #{message.from.first_name}")
		else
			bot.api.send_message(chat_id: message.chat.id, text: ANSWERS.sample)
		end
	end
end