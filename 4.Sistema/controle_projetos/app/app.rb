module ControleProjetos
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl
    enable :sessions


    use Rack::Session::Cookie,
        :expire_after => 2592000, #1 mês
        :secret => '&o6=-hx4hp+#7h4c_sq#lwvoqjyn!@hvjvn8zz_hb^@gypt6j#'
    enable :allow_disabled_csrf

    get :index do
      @account = Account.new
      render '/login/login'
    end
  end
end
