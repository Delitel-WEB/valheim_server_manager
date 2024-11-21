import asyncio

from bot.core import bot, dp
from bot.keyboard import shutdown_kb


async def main() -> None:
    await bot.send_message("Кнопка отключения сервера!", reply_markup=shutdown_kb())
    await dp.start_polling(bot)


asyncio.run(main())
