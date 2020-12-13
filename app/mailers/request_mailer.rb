class RequestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.approved.subject
  #
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
end
