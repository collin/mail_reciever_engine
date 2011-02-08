require "moneta"

class MailRecieverEngine < Rails::Engine
  autoload :Storage, "mail_reciever_engine/storage"
  autoload :Reciever, "mail_reciever_engine/reciever"
  
  ::ActionMailer::Base.add_delivery_method :mail_reciever_engine, MailRecieverEngine::Reciever
  
  initializer "paths" do
    paths.mail_reciever_datastore Rails.root + "db/mail_reciever_engine.#{Rails.env}.yml"

    config.mail_reciever_engine_moneta_backend = :YAML unless config.respond_to? :mail_reciever_engine_moneta_backend
    config.mail_reciever_engine_moneta_config = {
      :path => config.paths.mail_reciever_datastore.first
    } unless config.respond_to? :mail_reciever_engine_moneta_config
  end
end