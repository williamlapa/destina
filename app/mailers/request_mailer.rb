class RequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.approved.subject
  #
  before_action :set_image, :set_attachments

  def newrequest(request)
    @request = request # Instance variable => available in view
    mail(to: @request.user.email, subject: 'Portal de doações da RFB - Novo pedido criado!')
    # This will render a view in `app/views/request_mailer`!
  end

  def approved(request)
    @request = request # Instance variable => available in view
    mail(to: @request.user.email, subject: 'Pedido aprovado - Mercadoria disponível!')
    # This will render a view in `app/views/request_mailer`!
  end

  def docs(request)
    @request = request # Instance variable => available in view
    mail(to: @request.user.email, subject: 'Portal de doações da RFB - Documentação.')
    # This will render a view in `app/views/request_mailer`!
  end

  private

  def set_image
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
  end

  def set_attachments
    attachments.inline['docs.doc'] = File.read('app/assets/images/docs.doc', mode: 'rb')
  end
end
