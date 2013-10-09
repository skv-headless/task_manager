Configus.build Rails.env do
  env :production do
    admin_email "admin@task-manager.ru"
  end

  env :development, :parent => :production do
  end

  env :test, :parent => :production do
  end
end