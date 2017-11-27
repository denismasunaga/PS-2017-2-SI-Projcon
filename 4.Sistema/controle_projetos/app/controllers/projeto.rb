ControleProjetos::App.controllers :projeto do
  
  get :new do
    @projeto = Projeto.new
    render 'projeto/novo'
  end

  post :create do
      @projeto = Projeto.new(nome: params['nome'], descricao: params['descricao'],
                             status: params['status'])
    if @projeto.save
      redirect url(:inicial, :inicio)
    else
      render url(back)
    end
  end

  get :atualizar, :with => :id do
    ap params
    @projeto = Projeto.find_by(id: params['id'])
    render '/projeto/editar'
  end

  put :update do
    @projeto = Projeto.find_by(id: params['id'])
    if @projeto.update_attributes(nome: params['nome'], descricao: params['descricao'],
                                  status: params['status'])
      redirect url(:inicial, :inicio)
    end
  end

  delete :destroy, :with => :id do
    @projeto = Projeto.find_by(id: params['id'])
    if @projeto.delete
      redirect url(:inicial, :inicio)
    end
  end

end
