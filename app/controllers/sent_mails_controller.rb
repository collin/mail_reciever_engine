class SentMailsController < ApplicationController
  # GET /sent_mails
  # GET /sent_mails.xml
  def index
    @sent_mails = SentMail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sent_mails }
    end
  end

  # GET /sent_mails/1
  # GET /sent_mails/1.xml
  def show
    @sent_mail = SentMail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sent_mail }
    end
  end
end
