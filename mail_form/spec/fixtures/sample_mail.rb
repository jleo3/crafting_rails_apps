class SampleMail < MailForm::Base
  attributes :name, :email, :nickname
  validates :nickname, :absence => true

  before_deliver do
    callbacks << :before
  end

  after_deliver do
    callbacks << :after
  end
  
  def callbacks
    @callbacks ||= []
  end

  def headers
    { :to => "recipient@example.com", :from => self.email }
  end
end
