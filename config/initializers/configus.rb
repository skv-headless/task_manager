Configus.build Rails.env do
  env :production do
    admin_email "skv-headless@yandex.ru"
  end

  env :development do
    admin_email "skv-headless@yandex.ru"
  end

  env :test do
    admin_email "skv-headless@yandex.ru"
  end
end