ControleProjetos::App.controllers :account do
  
  post :create do
    @account = Account.new(name: params['name'], surname: params['surname'],
                           email: params['email'], password: params['password'],
                           password_confirmation: params['password_confirmation'], role: 'user')
    if @account.save
      set_current_account(@account)
      redirect url(:inicial, :inicio)
    else
      render url(:inicial, :cadastrar)
    end
  end
  

end
