ControleProjetos::App.controllers :login do

  post :create do
    ap params
    if account = Account.authenticate(params[:email], params[:password])
      ap account
      set_current_account(account)
      redirect url(:inicial, :inicio)
    else
      ap 'deu ruim'
      params[:email] = h(params[:email])
      render "/login/login", nil, :layout => false
    end
  end

  delete :destroy do
    set_current_account(nil)
    redirect url(:sessions, :new)
  end
end

