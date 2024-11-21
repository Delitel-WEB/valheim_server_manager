import subprocess

from aiogram import F
from aiogram.types import CallbackQuery

from ..cfg import SCREEN_SESSION_NAME
from ..core import dp


@dp.callback_query(F.data == "stop")
async def shutdown_server(callback: CallbackQuery) -> None:
    subprocess.run(f"screen -S {SCREEN_SESSION_NAME} -X stuff $'\003'", shell=True)  # noqa: ASYNC221, PLW1510
    await callback.answer("Сервер успешно остановлен!")
