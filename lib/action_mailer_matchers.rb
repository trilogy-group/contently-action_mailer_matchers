require "action_mailer_matchers/version"

module ActionMailerMatchers
  extend RSpec::Matchers::DSL

  matcher :have_received_email do |email_or_user|
    match do |email_or_user|
      received_email?(email_or_user, expected)
    end
  end

  matcher :have_received_cc_email do |email_or_user|
    match do |email_or_user|
      received_email?(email_or_user, expected, :cc)
    end
  end

  matcher :have_received_bcc_email do |email_or_user|
    match do |email_or_user|
      received_email?(email_or_user, expected, :bcc)
    end
  end

  def received_email?(email_or_user, expected, email_method = :to)
    expected_attrs = expected.present? ? expected : {}
    email = email_or_user.try(:email) || email_or_user
    email_subject = expected_attrs[:subject]
    body = expected_attrs[:body]

    matching_email = matching_mail_for(email, body, email_subject, email_method)

    expect(matching_email.present?).to eql(true)
  end

  def matching_mail_for(email, body, email_subject, email_method)
    deliveries.detect do |mail|
      has_expected_email = mail.send(email_method).include?(email)
      has_expected_body = body ? body_for(mail).include?(body) : true
      has_expected_subject = email_subject ? mail.subject.include?(email_subject) : true

      has_expected_email && has_expected_body && has_expected_subject
    end
  end

  def body_for(mail)
    if mail.try(:parts).present?
      mail.try(:parts).try(:first).try(:body).try(:raw_source)
    else
      mail.try(:body).try(:raw_source)
    end
  end

  def deliveries
    ActionMailer::Base.deliveries
  end
end
