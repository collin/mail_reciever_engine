class MailRecieverEngine::Reciever
  attr_accessor :settings
  
  def initialize(values)
    @settings = {}
  end
  
  def deliver!(mail)
    id = mail.message_id.split("@").first
    MailRecieverEngine::Storage[:all] += [id]
    MailRecieverEngine::Storage[id] = {
      :header => mail.header.to_s,
      :body => mail.body.to_s,
      :subject => mail.subject.to_s,
      :to => mail.to.to_sentence,
      :id => id
    }
  end
end
