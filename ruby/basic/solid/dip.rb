class EmailSender
  def initialize(client)
    @client = client
  end

  def send_email(to, subject, body)
    @client.connect
    @client.send(to, subject, body)
    @client.disconnect
  end
end

class GmailClient
  def connect
    p 'gmail connect'
  end

  def send(to, subject, body)
    # send email
  end

  def disconnect
    # disconnect from Gmail server
  end
end

class HotmailClient
  def connect
    p 'hotmail connect'
    # connect to Hotmail server
  end

  def send(to, subject, body)
    # send email
  end

  def disconnect
    # disconnect from Hotmail server
  end
end

class NaverMailClient
  def connect
    p 'naver mail connect'
    # connect to Hotmail server
  end

  def send(to, subject, body)
    # send email
  end

  def disconnect
    # disconnect from Hotmail server
  end
end

gmail_client = GmailClient.new
email_sender = EmailSender.new(gmail_client)
email_sender.send_email('recipient@example.com', 'Test email', 'This is a test email from Ruby')

hotmail_client = HotmailClient.new
email_sender = EmailSender.new(hotmail_client)
email_sender.send_email('recipient@example.com', 'Test email', 'This is a test email from Ruby')

naver_client = NaverMailClient.new
email_sender = EmailSender.new(naver_client)
email_sender.send_email('recipient@example.com', 'Test email', 'This is a test email from Ruby')
