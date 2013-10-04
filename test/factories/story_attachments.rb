# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory 'story/attachment' do
    path { Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'fixtures', 'file', 'example.png')) }
  end
end
