class MailRecieverEngine
  require "moneta/adapters/#{MailRecieverEngine.config.mail_reciever_engine_moneta_backend.to_s.downcase}"
  storage_class = Moneta::Adapters.const_get(MailRecieverEngine.config.mail_reciever_engine_moneta_backend)
  Storage = storage_class.new MailRecieverEngine.config.mail_reciever_engine_moneta_config
  Storage[:all] = [] unless Storage.has_key?(:all)
end