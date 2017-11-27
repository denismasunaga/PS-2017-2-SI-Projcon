ControleProjetos::App.controllers :inicial do
  
  get :login do
    render '/login/login'
  end

  get :cadastrar do
    render '/login/cadastrar'
  end

  get :inicio do
    @projetos = Projeto.all
    render '/inicial/telainicial'
  end
end
