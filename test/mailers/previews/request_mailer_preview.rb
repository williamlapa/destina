# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/approved
  def approved
    request = Request.first
    RequestMailer.approved(request)
  end

  def newrequest
    request = Request.first
    # This is how you pass value to params[:user] inside mailer definition!
    RequestMailer.newrequest(request)
  end
end
