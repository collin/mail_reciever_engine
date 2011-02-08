class SentMail
  def self.storage
    MailRecieverEngine::Storage
  end
  
  def self.all
    (storage[:all] || []).map{|id| find(id) }
  end
  
  def self.find(id)
    storage[id]
  end
  
  def to_param
    self[:id]
  end
end