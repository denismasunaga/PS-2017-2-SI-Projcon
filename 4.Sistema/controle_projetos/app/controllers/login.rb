ControleProjetos::App.controllers :login do

  post :create do
    ap params
    if account = Account.authenticate(params[:email], params[:password])
      set_current_account(account)
      redirect url(:inicial, :inicio)
    else
      params[:email] = h(params[:email])
      render "/login/login", nil, :layout => false
    end
  end

  delete :destroy, map: '/sair' do
    set_current_account(nil)
    redirect url(:login, :create)
  end
end

