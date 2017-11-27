module ControleProjetos
  class App < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl
    enable :sessions
    enable :authentication
    set    :login_page, "/"

    access_control.roles_for :any do |role|
      role.protect "/inicial/telainicial"
      role.protect "/projeto/editar"
      role.protect "/projeto/new"
      role.protect "/inicial/inicio"
    end

    use Rack::Session::Cookie,
        :expire_after => 2592000, #1 mês
        :secret => '&o6=-hx4hp+#7h4c_sq#lwvoqjyn!@hvjvn8zz_hb^@gypt6j#'
    enable :allow_disabled_csrf

    get :index do
      @account = Account.new
      render '/login/login', layout: false
    end
  end
end
